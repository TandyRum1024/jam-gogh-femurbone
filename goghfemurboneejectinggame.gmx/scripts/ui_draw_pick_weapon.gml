/// ui_draw_ingame()
/*
    draw ingame UI
*/

var _winwid = window_get_width();
var _winhei = window_get_height();
var _wincenterx = _winwid * 0.5;
var _wincentery = _winhei * 0.5;
var _msg = "";

// Draw filler (black, 50% alpha)
draw_sprite_stretched_ext(sprTiles, 28, 0, 0, window_get_width(), window_get_height(), c_black, 0.5);

// Draw weapons
var _wepmarginx = _winwid * 0.25;
var _wepmarginy = 0; // _winhei * 0.25;
var _wepscale   = 10;
var _wepsize    = GFX_TILE_SIZE * _wepscale;
var _wepdescscale = 1;

// Draw old weapon
var _wepoldspr   = weaponOld.spriteIdx;
var _wepoldscale = weaponOld.modelScale;
var _wepoldx = _wincenterx - _wepmarginx - _wepoldscale[@ 0] * _wepsize * 0.5;
var _wepoldy = _wincentery + _wepmarginy - _wepoldscale[@ 1] * _wepsize * 0.5;
draw_sprite_ext(sprTiles, _wepoldspr, _wepoldx, _wepoldy, _wepoldscale[@ 0] * _wepscale, _wepoldscale[@ 1] * _wepscale, 0, weaponOld.image_blend, 1.0);

// Draw old weapon's desc.
draw_set_halign(1); draw_set_valign(2);
_msg = "-=[OLD]=-#==========#" + weapon_to_str(weaponOld);
draw_text_transformed(_wincenterx - _wepmarginx, _winhei - 10, _msg, _wepdescscale, _wepdescscale, 0);

// Draw new weapon
var _wepnewspr   = weaponNew.spriteIdx;
var _wepnewscale = weaponNew.modelScale;
var _wepnewx = _wincenterx + _wepmarginx - _wepnewscale[@ 0] * _wepsize * 0.5;
var _wepnewy = _wincentery + _wepmarginy - _wepnewscale[@ 1] * _wepsize * 0.5;
draw_sprite_ext(sprTiles, _wepnewspr, _wepnewx, _wepnewy, _wepnewscale[@ 0] * _wepscale, _wepnewscale[@ 1] * _wepscale, 0, weaponNew.image_blend, 1.0);

// Draw new weapon's desc.
draw_set_halign(1); draw_set_valign(2);
_msg = "-=[NEW]=-#==========#" + weapon_to_str(weaponNew);
draw_text_transformed(_wincenterx + _wepmarginx, _winhei - 10, _msg, _wepdescscale, _wepdescscale, 0);

// Draw message
// Center message
var _col = make_color_hsv(current_time * 0.0001 * 255, 128, 255);
draw_set_halign(1); draw_set_valign(0);
_msg = "CHOOSE ONE UwU";
draw_text_transformed_color(_wincenterx, 13, _msg, 3, 3, 0, c_black, c_black, c_black, c_black, 1.0);
draw_text_transformed_color(_wincenterx, 10, _msg, 3, 3, 0, _col, _col, _col, _col, 1.0);

draw_set_halign(1); draw_set_valign(0);
_msg = "<LEFT CLICK : LEAVE IT>#<RIGHT CLICK : TAKE IT & SWAP IT>";
draw_text_transformed_color(_wincenterx, 11 + 3 * 16, _msg, 1, 1, 0, c_black, c_black, c_black, c_black, 1.0);
draw_text_transformed_color(_wincenterx, 10 + 3 * 16, _msg, 1, 1, 0, _col, _col, _col, _col, 1.0);
