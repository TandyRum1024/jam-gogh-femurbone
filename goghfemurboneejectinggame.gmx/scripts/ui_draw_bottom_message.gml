if (UIShowBottomMsg)
{
    var _winwid = window_get_width();
    var _winhei = window_get_height();
    var _strhei = string_height(UIBottomMsg) * UIBottomMsgScale;
    
    draw_set_halign(1); draw_set_valign(2);
    draw_sprite_stretched(sprTiles, 67, 0, _winhei - 10 - _strhei - 4, _winwid, _strhei + 8);
    draw_text_transformed_color(_winwid * 0.5, _winhei - 10 + UIBottomMsgScale, UIBottomMsg, UIBottomMsgScale, UIBottomMsgScale, 0, c_black, c_black, c_black, c_black, 1.0);
    draw_text_transformed_color(_winwid * 0.5, _winhei - 10, UIBottomMsg, UIBottomMsgScale, UIBottomMsgScale, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1.0);
}
