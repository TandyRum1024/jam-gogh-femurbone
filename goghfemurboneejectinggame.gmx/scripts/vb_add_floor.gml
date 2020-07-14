/// vb_add_floor(_vb, _x1, _y1, _z1, _x2, _y2, _z2, _u1, _v1, _u2, _v2, _colour, _alpha)
/*
    Appends floor primitive to triangle strip vertex buffer
*/
var _vb = argument0, _x1 = argument1, _y1 = argument2, _z1 = argument3, _x2 = argument4, _y2 = argument5, _z2 = argument6, _u1 = argument7, _v1 = argument8, _u2 = argument9, _v2 = argument10, _colour = argument11, _alpha = argument12;

// Triangle #1
vb_add_vertex(_vb, _x1, _y1, _z1, _u1, _v1, _colour, _alpha); // (top left vertex)
vb_add_vertex(_vb, _x2, _y1, _z2, _u2, _v1, _colour, _alpha); // (top right vertex)
vb_add_vertex(_vb, _x1, _y2, _z1, _u1, _v2, _colour, _alpha); // (bottom left vertex)
// Triangle #2
vb_add_vertex(_vb, _x1, _y2, _z1, _u1, _v2, _colour, _alpha); // (bottom left vertex)
vb_add_vertex(_vb, _x2, _y1, _z2, _u2, _v1, _colour, _alpha); // (top right vertex)
vb_add_vertex(_vb, _x2, _y2, _z2, _u2, _v2, _colour, _alpha); // (bottom right vertex)

// (top left vertex)
// vertex_position_3d(_vb, _x1, _y1, _z1); vertex_texcoord(_vb, 0, 0); vertex_colour(_vb, _colour, _alpha);

// (top right vertex)
// vertex_position_3d(_vb, _x2, _y1, _z1); vertex_texcoord(_vb, 1, 0); vertex_colour(_vb, _colour, _alpha);

// (bottom left vertex)
// vertex_position_3d(_vb, _x1, _y2, _z2); vertex_texcoord(_vb, 0, 1); vertex_colour(_vb, _colour, _alpha);

// (bottom right vertex)
// vertex_position_3d(_vb, _x2, _y2, _z2); vertex_texcoord(_vb, 1, 1); vertex_colour(_vb, _colour, _alpha);
