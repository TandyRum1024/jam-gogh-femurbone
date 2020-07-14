/// interp_weight(_val, _valmax, _weightbegin, _weightend)
/*
    Returns interpolation factor with weight applied
*/
var _val = argument0, _valmax = argument1, _weightbegin = argument2, _weightend = argument3;
return power(1.0 - power(1.0 - clamp(_val / _valmax, 0.0, 1.0), _weightend), _weightbegin);
