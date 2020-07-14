var _winwid = window_get_width();
var _winhei = window_get_height();
var _alpha = clamp(UIMessageTime / UIMessageFadeTime, 0.0, 1.0);

draw_set_halign(1); draw_set_valign(2);
var _strmaxwid = (_winwid * 0.8) / UIMessageScale;
draw_text_ext_transformed_color(_winwid * 0.5, _winhei * 0.5 + UIMessageScale, UIMessage, -1, _strmaxwid, UIMessageScale, UIMessageScale, 0, c_black, c_black, c_black, c_black, _alpha);
draw_text_ext_transformed_color(_winwid * 0.5, _winhei * 0.5, UIMessage, -1, _strmaxwid, UIMessageScale, UIMessageScale, 0, c_yellow, c_yellow, c_yellow, c_yellow, _alpha);
