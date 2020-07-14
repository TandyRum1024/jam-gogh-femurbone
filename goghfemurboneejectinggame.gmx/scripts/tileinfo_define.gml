/// tileinfo_define(_type, _u, _v, _spawnobj, _objx, _objy)
/*
    Declares & builds tile info and returns the array holding the built tile info
*/
var _type = argument0, _u = argument1, _v = argument2, _spawnobj = argument3, _objx = argument4, _objy = argument5;
var _tileinfo = -1;
_tileinfo[eTILE_INFO.TYPE] = _type;
_tileinfo[eTILE_INFO.U] = _u;
_tileinfo[eTILE_INFO.V] = _v;
_tileinfo[eTILE_INFO.OBJ] = _spawnobj;
_tileinfo[eTILE_INFO.OBJ_X] = _objx;
_tileinfo[eTILE_INFO.OBJ_Y] = _objy;

return _tileinfo;
