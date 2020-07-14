/// ui_draw_normal()
// draw normal UI
var _winwid = window_get_width();
var _winhei = window_get_height();
var _wincenterx = _winwid * 0.5;
var _wincentery = _winhei * 0.5;
var _msg = "";

// Draw top 
/*
    draw_set_halign(1); draw_set_valign(0);
    var _msg = "STATE : " + string(fsmStateCurrent) + "#FPS : " + string(fps_real);
    draw_text_colour(_wincenterx, 10, _msg, c_yellow, c_yellow, c_orange, c_orange, 1.0);
*/

if (intermissionShowInfo)
{
    // title
    var _strmaxwid = (_winwid * 0.8) / UIMessageScale;
    var _col = make_color_hsv(current_time * 0.0001 * 255, 200, 255);
    var _msg = "VAN GOGH FEMURBONE EJECTION ANECDOTE";
    var _hei = string_height_ext(_msg, -1, _strmaxwid) + 64;
    
    draw_set_halign(1); draw_set_valign(1);
    draw_sprite_stretched_ext(sprTiles, 28, 0, _winhei * 0.5 - _hei * 0.5, _winwid, _hei, c_black, 0.5);
    draw_text_ext_transformed_color(_winwid * 0.5, _winhei * 0.5 + UIMessageScale, _msg, -1, _strmaxwid, UIMessageScale, UIMessageScale, 0, c_black, c_black, c_black, c_black, 1.0);
    draw_text_ext_transformed_color(_winwid * 0.5, _winhei * 0.5, _msg, -1, _strmaxwid, UIMessageScale, UIMessageScale, 0, _col, _col, _col, _col, 1.0);
    
    // info
    var _msgy = _winhei - 10;
    _msg = "ENTERTAINMENTAL DIGITAL PAIN BY ZIK#================#F1 FOR FULLSCREEN OR#RESIZE YOUR WINDOW AS YOUR LIKINGS IDK#WASD : MOVE#MOUSE : LOOK & ATTACK#HOLD DOWN LEFT CLICK TO PREPARE YOUR SWING#TIP : YOU CAN PARRY OFF THE ENEMIES ATTACK";
    draw_set_halign(1); draw_set_valign(2);
    
    draw_text_transformed_color(_winwid * 0.5, _msgy + UIBottomMsgScale, _msg, UIBottomMsgScale, UIBottomMsgScale, 0, c_black, c_black, c_black, c_black, 1.0);
    draw_text_transformed_color(_winwid * 0.5, _msgy, _msg, UIBottomMsgScale, UIBottomMsgScale, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1.0);
}

// Draw bottom message
ui_draw_bottom_message();

// Draw Message
ui_draw_screen_message();
