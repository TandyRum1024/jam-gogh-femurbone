/// state_enemy_chase()
/*
    Chasing state of enemy
*/
if (!fsmStateInit)
{
    chaseLostCtr = 0;
}

// (dampen the velocity)
vx *= velDamp;
vy *= velDamp;

// Update enemy's movement
var _playerdir = point_direction(x, y, oPlayer.x, oPlayer.y);
mv_accelerate(-_playerdir, moveVelAccel, moveVelMax);

// Face player
lookDir -= angle_difference(lookDir, _playerdir) * 0.1;

// Update enemy's position
mv_update_x();
mv_update_y();

// Update enemy damage & HP
mob_update_damage();

// Check for state switches
var _playerdist = point_distance(x, y, oPlayer.x, oPlayer.y);
if (collision_line(x, y, oPlayer.x, oPlayer.y, oTileSolid, false, true))
{
    // Lost sight
    if (chaseLostCtr < room_speed)
    {
        chaseLostCtr++;
    }
    else
    {
        // .. And lost interest in player
        fsm_set_state("idle");
        show_debug_message("LOST INTEREST");
    }
}
else
{
    if (_playerdist < weapon.attackdist)
    {
        fsm_set_state("melee_swing");
    }
    chaseLostCtr = 0;
}
