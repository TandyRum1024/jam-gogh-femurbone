#define anim_sinewave
/// anim_sinewave(_freq, _amp)
/*
    Returns animated sinewave value
    default freq. : 1 oscillations per second
*/

var _freq = argument0, _amp = argument1;
return sin(current_time * _freq * 0.001 * 2 * pi) * _amp;

#define anim_cosinewave
/// anim_cosinewave(_freq, _amp)
/*
    Returns animated cosinewave value
    default freq. : 1 oscillations per second
*/

var _freq = argument0, _amp = argument1;
return cos(current_time * _freq * 0.001 * 2 * pi) * _amp;