/// state_control_pick_weapon()
/*
    Pick weapons state
*/
if (!fsmStateInit)
{
    global.gamePaused = true;
    
    // Disable screen fill overlay
    ui_screen_fill(c_white, 0.0);
    
    if (!instance_exists(weaponPickupInst))
    {
        control_transition_to(room_speed * 0.1, fsmStatePrev);
    }
    else
    {
        // Fetch weapon from player and weapon pickup
        weaponOld = oPlayer.weapon;
        weaponNew = weaponPickupInst.weapon;
    }
    
    // Reset players weapon pickup flag
    oPlayer.interactWeaponPickupUsed = false;
    
    // Play sfx : weapon get
    sfx_emit(sndOk, 1.0, random_range(0.95, 1.05));
}
else if (!transitionInProgress)
{
    // Debug : show room in GUI
    // oRoom.debugDrawMap ^= keyboard_check_pressed(vk_f1);
    
    // Check if the weapon pickup instance doesn't exists
    if (!instance_exists(weaponPickupInst))
    {
        control_transition_to(room_speed * 0.1, fsmStatePrev);
    }
    else
    {
        // If player has choosen the weapon
        // (left button : keep weapon)
        if (mouse_check_button_pressed(mb_left))
        {
            control_transition_to(room_speed * 0.1, fsmStatePrev);
            
            // Play sfx : nope
            sfx_emit(sndNo, 1.0, random_range(0.95, 1.05));
        }
        
        // (right button : get & replace new weapon w/ previous one)
        if (mouse_check_button_pressed(mb_right))
        {
            control_transition_to(room_speed * 0.1, fsmStatePrev);
            
            // Swap weapon
            weaponOld.owner = noone;
            weaponPickupInst.weapon = weaponOld;
            with (oPlayer)
            {
                weapon = other.weaponNew;
                weapon.owner = id;
            }
            
            // Set players weapon state to idle so we can switch to appropirate states
            with (oPlayer.weapon)
            {
                fsm_set_state("idle");
                
                // Reset weapon model info
                x = 0;
                y = 0;
                z = 0;
                modelRot = makearray(0, 0, 0);
                modelDraw = false;
            }
            
            // Reset viewmodel
            with (oPlayer.viewmodel)
            {
                fsm_set_state("idle");
            }
            
            // Play sfx : yes
            sfx_emit(sndOk, 1.0, random_range(0.95, 1.05));
        }
    }
}
