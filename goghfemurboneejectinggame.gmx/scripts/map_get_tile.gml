/// map_get_tile(_x, _y)
/*
    Checks if there's tile in given position and returns type of tile
    returns eTILE.FLOOR if the position is out of bounds
*/

var _x = argument0, _y = argument1;

// Calculate tile-space coordinates from position
var _tx = floor(_x / GFX_TILE_SIZE), _ty = floor(_y / GFX_TILE_SIZE);

// Check if the coordinates are out of bounds
if (_tx < 0 || _tx >= oRoom.tilesWid ||
    _ty < 0 || _ty >= oRoom.tilesHei)
{
    return eTILE.FLOOR;
}

// Return the tiles
return oRoom.tiles[# _tx, _ty];
