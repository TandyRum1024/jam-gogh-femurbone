/// state_control_ingame()
/*
    In-game state
*/
if (!fsmStateInit)
{
    global.gamePaused = false;
    
    // Disable screen fill overlay
    ui_screen_fill(c_white, 0.0);
    
    // Play music : music
    mus_play(musInGame, 1.0);
}
else
{
    // Debug : show room in GUI
    // oRoom.debugDrawMap ^= keyboard_check_pressed(vk_f1);
    
    // If player has died & requested retry
    // Then go back to starting room
    if (oPlayer.fsmStateCurrent == "dead")
    {
        if (!transitionInProgress && keyboard_check_pressed(ord('R')))
        {
            control_transition_to(room_speed * 0.5, "room_enter_intermission");
        }
        // fade out music
        audio_sound_gain(global.musSoundIdx, 0, room_speed * 2);
    }
    
    // If player has entered the 'door'
    // Then enter random room
    if (!transitionInProgress && oPlayer.interactDoorUsed)
    {
        control_transition_to(room_speed * 0.5, "room_enter");
    }
    
    // If player has picked up the weapon
    // Then switch to weapon confirmination screen
    if (oPlayer.interactWeaponPickupUsed && instance_exists(oPlayer.interactInstWeaponPickup))
    {
        weaponPickupInst = oPlayer.interactInstWeaponPickup;
        control_transition_to(room_speed * 0.1, "pick_weapon");
    }
    
    // Check for out of focus or paused
    if (os_is_paused() || !window_has_focus() ||
        keyboard_check_pressed(vk_escape))
    {
        fsm_set_state("paused");
    }
}
