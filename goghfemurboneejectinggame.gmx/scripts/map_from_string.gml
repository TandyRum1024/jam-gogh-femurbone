#define map_from_string
/// map_from_string(_tabledata)
/*
    Creates ds_grid from string(s) with given table of tokens
    The first argument is a token table in a form of string and array that represents what index the characters in string should have
    For example, (array)["#ABC", (array)[1,4,3,2]] results :
     > '#' having value of 1
     > 'A' having value of 4
     > 'B' having value of 3
     > 'C' having value of 2
*/

var _tabledata = argument0;
var _tablekey = _tabledata[@ 0];
var _tableval = _tabledata[@ 1];
var _wid = string_length(argument[1]);
var _hei = argument_count;
var _grid = ds_grid_create(_wid, _hei - 1); // -1 off the height because actual map data begins from index 1

for (var _iy=1; _iy<_hei; _iy++)
{
    var _y = _iy - 1; // real y index
    // (fetch row of string)
    var _str = argument[_iy];
    
    for (var _x=0; _x<_wid; _x++)
    {
        // (for each string's character, convert it into index & use it to fetch the values from token value table)
        // (then assign that as current grid's tile value)
        _grid[# _x, _y] = _tableval[@ (string_pos(string_char_at(_str, _x), _tablekey) - 1)];
    }
}

return _grid;

#define map_from_string_arr
/// map_from_string_arr(_data)
/*
    Creates ds_grid from string(s) with given table of tokens (which is all stored in a single array)
    The first element of the _data array is a token table in a form of string and array that represents what index the characters in string should have
    For example, (array)["#ABC", (array)[1,4,3,2]] results :
     > '#' having value of 1
     > 'A' having value of 4
     > 'B' having value of 3
     > 'C' having value of 2
*/

var _data = argument0;
// (fetch table's key & value data)
var _tabledata = _data[@ 0];
var _tablekey = _tabledata[@ 0];
var _tableval = _tabledata[@ 1];
var _wid = string_length(_data[@ 1]);
var _hei = array_length_1d(_data);
var _grid = ds_grid_create(_wid, _hei - 1); // -1 off the height because actual map data begins from index 1

for (var _iy=1; _iy<_hei; _iy++)
{
    var _y = _iy - 1; // real y index
    // (fetch row of string)
    var _str = _data[@ _iy];
    
    for (var _x=0; _x<_wid; _x++)
    {
        // (for each string's character, convert it into index & use it to fetch the values from token value table)
        // (then assign that as current grid's tile value)
        _grid[# _x, _y] = _tableval[@ (string_pos(string_char_at(_str, _x + 1), _tablekey) - 1)];
    }
}

return _grid;