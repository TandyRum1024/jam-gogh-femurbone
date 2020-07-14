/// ui_screen_flash(_time, _col)
/*
    Flashes screen for given duration
*/
var _time = argument0, _col = argument1;
oControl.UIFlashColour = _col;
oControl.UIFlashTime = _time;
oControl.UIFlashTimeMax = _time;
