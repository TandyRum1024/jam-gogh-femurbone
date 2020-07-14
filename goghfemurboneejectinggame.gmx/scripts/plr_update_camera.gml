/// plr_update_camera()
/*
    Updates camera for player
*/

// Set camera's height
oCamera.z = height;

// Reset camera's roll target
oCamera.lookRollTarget = 0;

// Update mouselook
// lookEnabled ^= keyboard_check_pressed(vk_escape); // press ESC to toggle mouselook
// if (os_is_paused() || !window_has_focus())
//     lookEnabled = false;
if (lookEnabled)
{
    // (get windows center position & calculate mouse movement)
    var _wincenterx = window_get_width() * 0.5, _wincentery = window_get_height() * 0.5;
    var _inputmousex = (window_mouse_get_x() - _wincenterx) * lookSensitivity;
    var _inputmousey = (window_mouse_get_y() - _wincentery) * lookSensitivity;
    
    // (reposition the mouse at screen center)
    window_mouse_set(_wincenterx, _wincentery);
    
    // (apply rotation to player)
    lookDir += _inputmousex;
    oCamera.lookV -= _inputmousey;
    
    // Apply camera roll
    oCamera.lookRollTarget += clamp(_inputmousex * 0.1, -10, 10);
}

// Update camera's roll and bob effect
// (camera roll)
var _sidevel = dot_product(oCamera.vecRx, oCamera.vecRy, vx, vy) * 10.0;
oCamera.lookRollTarget += clamp(_sidevel, -20, 20);

// (camera bob)
var _vel = point_distance(0, 0, vx, vy) / moveVelMax;
oCamera.FXBobIntensity = lerp(oCamera.FXBobIntensity, _vel, 0.1);
oCamera.FXBobCtr = moveCtr;

// Set follow mode for camera
with (oCamera)
{
    fsm_set_state("follow");
    followInst = other;
    lookH = other.lookDir;
}
