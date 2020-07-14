/// state_enemy_idle()
/*
    Idle state of enemy
*/
// (dampen the velocity)
vx *= velDamp;
vy *= velDamp;

// Update enemy's position
mv_update_x();
mv_update_y();

// Update enemy damage & HP
mob_update_damage();

// Check for state switches
var _playerdist = point_distance(x, y, oPlayer.x, oPlayer.y);
if (_playerdist < chaseRange && !collision_line(x, y, oPlayer.x, oPlayer.y, oTileSolid, false, true))
{
    fsm_set_state("chase");
}
