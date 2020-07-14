/// state_enemy_melee_swing()
/*
    Melee attacking state of enemy
*/
if (!fsmStateInit)
{
    // Activate weapon
    with (weapon)
    {
        event_user(3);
    }
}

// (dampen the velocity)
vx *= velDamp;
vy *= velDamp;

// Update enemy's position
mv_update_x();
mv_update_y();

// Update enemy damage & HP
mob_update_damage();

// Check for state switches
if (fsmStateCtr > oGamevars.metaEnemyFSMMeleeSwingDuration && weapon.fsmStateCurrent == "melee_idle")
{
    fsm_set_state("idle");
}
