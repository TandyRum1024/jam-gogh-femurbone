/// update_input()
/*
    Updates players input
*/

inputH      = keyboard_check(inputBindL) - keyboard_check(inputBindR);
inputHPress = keyboard_check_pressed(inputBindL) - keyboard_check_pressed(inputBindR);
inputV      = keyboard_check(inputBindU) - keyboard_check(inputBindD);
inputVPress = keyboard_check_pressed(inputBindU) - keyboard_check_pressed(inputBindD);

inputAttack      = mouse_check_button(inputBindAttack);
inputAttackPress = mouse_check_button_pressed(inputBindAttack);
inputUse        = mouse_check_button(inputBindUse);
inputUsePress   = mouse_check_button_pressed(inputBindUse);
