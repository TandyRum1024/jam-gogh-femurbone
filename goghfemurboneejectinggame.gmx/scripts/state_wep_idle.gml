/// state_wep_idle : Generic weapon idle state
// Switch to appropriate state with respect to weapon type
switch (type)
{
    case eWEAPON.MELEE:
        fsm_set_state("melee_idle");
        break;
        
    case eWEAPON.RANGED:
        fsm_set_state("ranged_idle");
        break;
}
