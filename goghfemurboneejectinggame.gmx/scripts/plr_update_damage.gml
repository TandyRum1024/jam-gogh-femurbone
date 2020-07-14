// Update player damage
// Set mask to normal hitbox
mask_index = maskEntity;

// Check vs. mob melee
var _meleehitbox = instance_place(x, y, oMeleeMob);
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
    
    // Flash the screen red
    ui_screen_flash(room_speed * 0.5, c_red);
}
