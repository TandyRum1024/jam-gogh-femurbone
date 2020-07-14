/// state_control_paused()
/*
    Paused state
*/
if (!fsmStateInit)
{
    global.gamePaused = true;
    
    // Disable screen fill overlay
    ui_screen_fill(c_white, 0.0);
}
else
{
    // Check for unpause
    if (keyboard_check_pressed(vk_escape))
    {
        fsm_set_state(fsmStatePrev);
    }
}
