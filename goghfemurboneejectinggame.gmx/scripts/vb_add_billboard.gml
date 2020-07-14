/// vb_strip_add_billboard(_vb, _x, _y, _z, _w, _h, _u1, _v1, _u2, _v2, _colour, _alpha)
/*
    Appends billobard / plane data in vertex buffer w/ triangle strip primitive type
*/
var _vb = argument0, _x = argument1, _y = argument2, _z = argument3, _w = argument4, _h = argument5, _u1 = argument6, _v1 = argument7, _u2 = argument8, _v2 = argument9, _colour = argument10, _alpha = argument11;

// Calculate vector tangent to camera's direction
// inverse distance lets us to just use 1 division & 2 multiplications instead of 2 divisions for normalizing.. idk
var _nx = _x - oCamera.x, _ny = _y - oCamera.y;
var _invdist = (1 / sqrt(sqr(_nx) + sqr(_ny))) * 0.5; // also we pre-multiply the 0.5 to account the full-width & height parameter
_nx *= _invdist;
_ny *= _invdist;

// Use the tangent vector to draw the wall
vb_add_wall(_vb,    _x + _ny * _w, _y - _nx * _w, _z - _h,
                    _x + _ny * _w, _y - _nx * _w, _z - _h,
                    _u1, _v1, _u2, _v2,
                    _colour, _alpha);
