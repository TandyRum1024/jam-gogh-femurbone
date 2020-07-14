#define map_check_collision_at
/// map_check_collision_at(_x, _y)
/*
    Checks if there's collidable tile in given position
*/

var _x = argument0, _y = argument1;

// Calculate tile-space coordinates from position
var _tx = floor(_x / GFX_TILE_SIZE), _ty = floor(_y / GFX_TILE_SIZE);

// Check if the coordinates are out of bounds
if (_tx < 0 || _tx >= oRoom.tilesWid ||
    _ty < 0 || _ty >= oRoom.tilesHei)
{
    return false;
}

// Fetch the tile and check if the tile is solid
var _tile = oRoom.tiles[# _tx, _ty];
var _tileinfo = global.TILE_INFO[@ _tile];
if (_tileinfo[@ eTILE_INFO.TYPE] == eTILE_TYPE.WALL)
{
    return true;
}
else
{
    return false;
}

#define map_check_collision_rect
/// map_check_collision_rect(_x, _y, _halfw, _halfh)
/*
    Checks if there's collidable tile in given center-aligned rectangular bounds
*/

var _x = argument0, _y = argument1, _halfw = argument2, _halfh = argument3;

// Calculate box's bounds in tile space
var _bx1 = floor((_x - _halfw) / GFX_TILE_SIZE), _by1 = floor((_y - _halfh) / GFX_TILE_SIZE);
var _bx2 = floor((_x + _halfw) / GFX_TILE_SIZE), _by2 = floor((_y + _halfh) / GFX_TILE_SIZE);

// Iterate & check if the cells overlapping w/ the bounds has any solid tiles
for (var _ty=_by1; _ty<=_by2; _ty++)
{
    for (var _tx=_bx1; _tx<=_bx2; _tx++)
    {
        // Check if the coordinates are out of bounds
        if (_tx < 0 || _tx >= oRoom.tilesWid ||
            _ty < 0 || _ty >= oRoom.tilesHei)
        {
            continue;
        }
        
        // Otherwise, check for solid tile
        var _tile = oRoom.tiles[# _tx, _ty];
        var _tileinfo = global.TILE_INFO[@ _tile];
        if (_tileinfo[@ eTILE_INFO.TYPE] == eTILE_TYPE.WALL)
        {
            return true;
        }
    }
}

return false;