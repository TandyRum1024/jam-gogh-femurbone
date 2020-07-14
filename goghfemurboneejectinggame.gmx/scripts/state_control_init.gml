/// state_control_normal()
/*
    yoy
*/
if (!fsmStateInit)
{
    // (do some init stuffs here)
    // Summon important system objects
    event_user(0);
}
else
{
    // (do some state update stuffs here)
    // Continue to intermission
    fsm_set_state("room_enter_intermission");
}
