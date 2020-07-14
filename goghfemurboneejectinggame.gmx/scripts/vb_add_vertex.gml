/// vb_add_vertex(_vb, _x, _y, _z, _u, _v, _col, _alpha)
/*
    Adds vertex data to vertex buffer
*/
var _vb = argument0, _x = argument1, _y = argument2, _z = argument3, _u = argument4, _v = argument5, _col = argument6, _alpha = argument7;
vertex_position_3d(_vb, _x, _y, _z); vertex_texcoord(_vb, _u, _v); vertex_colour(_vb, _col, _alpha);
