/// plr_convert_direction(_plr)
/*
    Converts & returns 'real' direction of players direction for use in weapon & stuffs
*/
var _plr = argument0;
return -(_plr.lookDir + 180);
