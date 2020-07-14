/// state_enemy_hurt()
/*
    Hurt state of enemy
*/
if (!fsmStateInit)
{
    // Set weapon state to stun
    with (weapon)
    {
        fsm_set_state("melee_stun");
    }
    
    // Check if the health is below zero
    if (hp <= 0)
    {
        instance_destroy();
        // Play sfx : kill
        sfx_emit(sndKill, 1.0, random_range(0.95, 1.05));
    }
    else
    {
        // Play sfx : flesh impact
        sfx_emit(choose(sndHit1, sndHit2), 1.0, random_range(0.95, 1.05));
    }
}

// (dampen the velocity)
vx *= velDamp;
vy *= velDamp;

// Update enemy's position
mv_update_x();
mv_update_y();

// Update enemy's tint
var _interp = interp_weight(fsmStateCtr, oGamevars.metaEnemyFSMHurtDuration, 1.0, 2.0);
image_blend = merge_color(c_red, c_white, _interp);

// Check for state switches
if (fsmStateCtr > oGamevars.metaEnemyFSMHurtDuration)
{
    fsm_set_state("idle");
}

// Check for state exit
if (fsmStateNext != "hurt")
{
    image_blend = c_white;
}
