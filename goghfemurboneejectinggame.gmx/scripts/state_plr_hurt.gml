/// state_plr_hurt()
/*
    Hurt state of player
*/
if (!fsmStateInit)
{
    // Check if HP is below 0
    if (hp <= 0)
    {
        fsm_set_state("dead");
    }
    
    // Play sfx : player ouch
    sfx_emit(sndPlayerHurt, 1.0, random_range(0.5, 0.75));
}

// Update input
plr_update_input();

// Update player's physics
plr_update_phyiscs();

// Update player's camera
plr_update_camera();

// Check for state switches
if (fsmStateCtr > oGamevars.metaPlayerFSMHurtDuration)
{
    fsm_set_state("normal");
}
