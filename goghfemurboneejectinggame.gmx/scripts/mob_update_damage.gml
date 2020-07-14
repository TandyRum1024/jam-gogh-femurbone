/// Checks for various damage
// Check for vs. melee
var _meleehitbox = instance_place(x, y, oMeleePlayer);
if (_meleehitbox != noone)
{
    // Apply damage and knockback
    // (apply damage)
    hp -= _meleehitbox.damage;
    
    // (apply knockback)
    vx += lengthdir_x(_meleehitbox.knockback, _meleehitbox.image_angle);
    vy += lengthdir_y(_meleehitbox.knockback, _meleehitbox.image_angle);
    
    // Switch to hurt state
    fsm_set_state("hurt");
}
