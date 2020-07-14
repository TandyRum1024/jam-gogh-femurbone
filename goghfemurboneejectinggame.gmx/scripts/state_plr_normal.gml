/// state_plr_normal()
/*
    Normal state of player
*/
// Update input
plr_update_input();

// (dampen the velocity)
vx *= velDamp;
vy *= velDamp;

// Update player movement
plr_update_movement();

// Update player's position
plr_update_phyiscs();

// Update player's interaction
plr_update_interaction();

// Update damage and HP
plr_update_damage();

// Debug : reroll weapons by pressing R
if (keyboard_check_pressed(ord('R')))
{
    instance_destroy(weapon);
    weapon = generate_weapon();
    weapon.owner = id;
}

// Update player's camera
plr_update_camera();
