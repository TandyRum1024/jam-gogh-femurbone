/// ui_draw_ingame()
/*
    draw ingame UI
*/

var _winwid = window_get_width();
var _winhei = window_get_height();
var _wincenterx = _winwid * 0.5;
var _wincentery = _winhei * 0.5;
var _msg = "";

// Draw message
/*
    draw_set_halign(1); draw_set_valign(0);
    var _msg = "STATE : " + string(fsmStateCurrent) + "#FPS : " + string(fps_real) + "#HP : " + string(oPlayer.hp);
    draw_text(_wincenterx, 10, _msg
*/

if (oPlayer.fsmStateCurrent != "dead")
{
    // Draw bottom message
    ui_draw_bottom_message();
    
    // Draw score
    var _alpha = clamp(UIMessageTime / UIMessageFadeTime, 0.0, 1.0);
    draw_set_halign(1); draw_set_valign(0);
    draw_text_transformed_color(_winwid * 0.5, _winhei * 0.5 + 4, string(gameScore), 4, 4, 0, c_black, c_black, c_black, c_black, _alpha);
    draw_text_transformed_color(_winwid * 0.5, _winhei * 0.5, string(gameScore), 4, 4, 0, c_yellow, c_yellow, c_yellow, c_yellow, _alpha);
    
    // Draw Message
    ui_draw_screen_message();
    
    // Draw health on the side
    var _healthwid      = 32;
    var _healthhei      = _winhei * 0.75;
    var _healthxbase    = 64;
    var _healthx        = _healthxbase - _healthwid * 0.5;
    var _healthy        = _wincentery - _healthhei * 0.5;
    var _healthinterpraw= oPlayer.hp / oPlayer.hpMax;
    var _healthinterp   = clamp(_healthinterpraw, 0, 1);
    var _healthbary     = _healthy + _healthhei * (1.0 - _healthinterp);
    var _healthbarhei   = _healthhei * _healthinterp;
    draw_sprite_stretched(sprTiles, 67, _healthx, _healthy, _healthwid, _healthhei); // BG
    draw_sprite_stretched(sprTiles, 48, _healthx, _healthbary, _healthwid, _healthbarhei); // FG
    
    // Draw health values
    draw_set_halign(1); draw_set_valign(0);
    var _healthstr = string(floor(_healthinterpraw * 100)) + "%";
    draw_text_transformed_color(_healthxbase, _healthy + _healthhei + 11, _healthstr, 1, 1, 0, c_black, c_black, c_black, c_black, 1.0);
    draw_text_transformed_color(_healthxbase, _healthy + _healthhei + 10, _healthstr, 1, 1, 0, c_white, c_white, c_white, c_white, 1.0);
    
    // Draw health title
    draw_set_halign(1); draw_set_valign(2);
    draw_text_transformed_color(_healthxbase, _healthy + 1, "HP", 1, 1, 0, c_black, c_black, c_black, c_black, 1.0);
    draw_text_transformed_color(_healthxbase, _healthy, "HP", 1, 1, 0, c_white, c_white, c_white, c_white, 1.0);
}
else
{
    // Draw game over message
    var _col = make_color_hsv(current_time * 0.0001 * 255, 128, 255);
    _msg = "RIP#============#SCORE : " + string(gameScore) + "#PRESS <R>";
    draw_set_halign(1); draw_set_valign(1);
    draw_text_transformed_color(_wincenterx, _wincentery + 2, _msg, 2, 2, 0, c_black, c_black, c_black, c_black, 1.0);
    draw_text_transformed_color(_wincenterx, _wincentery, _msg, 2, 2, 0, _col, _col, _col, _col, 1.0);
}
