/// ui_draw_paused()
/*
    draw paused UI
*/

var _winwid = window_get_width();
var _winhei = window_get_height();
var _wincenterx = _winwid * 0.5;
var _wincentery = _winhei * 0.5;
var _msg = "PAUSED.#<ESC> to continue";
var _scale = 3;

// Draw filler (black, 50% alpha)
draw_sprite_stretched_ext(sprTiles, 28, 0, 0, window_get_width(), window_get_height(), c_black, 0.5);

// Draw information / message
var _col = make_color_hsv(current_time * 0.0001 * 255, 128, 255);
draw_set_halign(1); draw_set_valign(1);
draw_text_transformed_color(_wincenterx, _wincentery + _scale, _msg, _scale, _scale, 0, c_black, c_black, c_black, c_black, 1.0);
draw_text_transformed_color(_wincenterx, _wincentery, _msg, _scale, _scale, 0, _col, _col, _col, _col, 1.0);
