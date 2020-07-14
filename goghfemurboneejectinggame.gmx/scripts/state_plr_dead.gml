/// state_plr_dead()
/*
    Dead state of player
*/
if (!fsmStateInit)
{
    // Disable camera bob 
    oCamera.FXBobIntensity = 0;
    oCamera.FXBobCtr = 0;
    
    // Apply camera roll
    var _sidevel = dot_product(oCamera.vecRx, oCamera.vecRy, vx, vy);
    if (_sidevel > 0)
        oCamera.lookRollTarget = 90;
    else
        oCamera.lookRollTarget = -90;
        
    // Make player lay on the ground
    height = 1;
    oCamera.z = height;
    
    // Disable viewmodel drawing
    viewmodel.drawViewmodel = false;
    
    // Play sfx : kill
    sfx_emit(sndPlayerHurt, 1.0, random_range(0.95, 1.05));
}

// Update input
plr_update_input();

// Update player's physics
// (dampen the velocities)
vx *= 0.97;
vy *= 0.97;
plr_update_phyiscs();

// Update player's camera
// Set follow mode for camera
with (oCamera)
{
    fsm_set_state("follow");
    followInst = other;
    lookH = other.lookDir;
}

