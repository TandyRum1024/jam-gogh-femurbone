/// vb_add_tile(_vb, _tilex, _tiley, _first)
/*
    Appends floor or walls primitive to triangle strip vertex buffer
    (meant to be executed on oRoom only)
*/

var _vb = argument0, _tilex = argument1, _tiley = argument2, _first = argument3;

// Fetch tile data from grid
var _tile    = tiles[# _tilex, _tiley];
var _tilegfx = global.TILE_INFO[@ _tile];
var _tilegfxtype = _tilegfx[@ 0]; // type of tile graphics

// Get tile positions in world space
var _realx = _tilex * GFX_TILE_SIZE;
var _realy = _tiley * GFX_TILE_SIZE;

// Draw walls or floor depending on the type of tile
var _texeltileunit = GFX_TILE_SIZE / 128;
var _u1 = _tilegfx[@ 1] * _texeltileunit;
var _v1 = _tilegfx[@ 2] * _texeltileunit;
var _u2 = _u1 + _texeltileunit;
var _v2 = _v1 + _texeltileunit;

// (preset : floor texcoords)
var _floorgfx = global.TILE_INFO[@ eTILE.FLOOR];
var _flooru1 = _floorgfx[@ 1] * _texeltileunit;
var _floorv1 = _floorgfx[@ 2] * _texeltileunit;
var _flooru2 = _flooru1 + _texeltileunit;
var _floorv2 = _floorv1 + _texeltileunit;

// (preset : ceiling texcoords)
var _ceilgfx = global.TILE_INFO[@ eTILE.CEILING];
var _ceilu1 = _ceilgfx[@ 1] * _texeltileunit;
var _ceilv1 = _ceilgfx[@ 2] * _texeltileunit;
var _ceilu2 = _ceilu1 + _texeltileunit;
var _ceilv2 = _ceilv1 + _texeltileunit;

switch (_tilegfxtype)
{
    case eTILE_TYPE.FLOOR:
        vb_add_floor(_vb, _realx, _realy, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, 0, _u1, _v1, _u2, _v2, c_white, 1.0);
        
        // Add ceiling
        vb_add_floor(_vb, _realx, _realy, tilesWallHeight, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, tilesWallHeight, _ceilu1, _ceilv1, _ceilu2, _ceilv2, c_white, 1.0);
        break;
        
    case eTILE_TYPE.NORMAL_FLOOR:
        vb_add_floor(_vb, _realx, _realy, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, 0, _flooru1, _floorv1, _flooru2, _floorv2, c_white, 1.0);
        
        // Add ceiling
        vb_add_floor(_vb, _realx, _realy, tilesWallHeight, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, tilesWallHeight, _ceilu1, _ceilv1, _ceilu2, _ceilv2, c_white, 1.0);
        break;
        
    case eTILE_TYPE.STUFF_ON_FLOOR:
        vb_add_floor(_vb, _realx, _realy, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, 0, _flooru1, _floorv1, _flooru2, _floorv2, c_white, 1.0);
        vb_add_floor(_vb, _realx, _realy, 1, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, 1, _u1, _v1, _u2, _v2, c_white, 1.0);
        
        // Add ceiling
        vb_add_floor(_vb, _realx, _realy, tilesWallHeight, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, tilesWallHeight, _ceilu1, _ceilv1, _ceilu2, _ceilv2, c_white, 1.0);
        break;
        
    case eTILE_TYPE.WALL:
        // 'top' side of wall
        vb_add_wall(_vb, _realx, _realy, 0, _realx + GFX_TILE_SIZE, _realy, tilesWallHeight, _u1, _v1, _u2, _v2, c_white, 1.0);
        // 'left' side of wall
        vb_add_wall(_vb, _realx, _realy, 0, _realx, _realy + GFX_TILE_SIZE, tilesWallHeight, _u1, _v1, _u2, _v2, c_white, 1.0);
        // 'bottom' side of wall
        vb_add_wall(_vb, _realx, _realy + GFX_TILE_SIZE, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, tilesWallHeight, _u1, _v1, _u2, _v2, c_white, 1.0);
        // 'right' side of wall
        vb_add_wall(_vb, _realx + GFX_TILE_SIZE, _realy, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, tilesWallHeight, _u1, _v1, _u2, _v2, c_white, 1.0);
        break;
}
/*
    switch (_tile)
    {
        case eTILE.SPAWN_PLR:
        case eTILE.FLOOR:
            vb_add_floor(_vb, _realx, _realy, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, 0, _tilegfx, c_black, 1.0);
            break;
            
        case eTILE.DOOR_OPEN:
            vb_add_floor(_vb, _realx, _realy, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, 0, _tilegfx, c_white, 1.0);
            break;
        
        case eTILE.DOOR_CLOSE:
        case eTILE.WALL:
            // 'top' side of wall
            vb_add_wall(_vb, _realx, _realy, 0, _realx + GFX_TILE_SIZE, _realy, tilesWallHeight, _tilegfx, c_white, 1.0);
            
            // 'left' side of wall
            vb_add_wall(_vb, _realx, _realy, 0, _realx, _realy + GFX_TILE_SIZE, tilesWallHeight, _tilegfx, c_white, 1.0);
            
            // 'bottom' side of wall
            vb_add_wall(_vb, _realx, _realy + GFX_TILE_SIZE, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, tilesWallHeight, _tilegfx, c_white, 1.0);
            
            // 'right' side of wall
            vb_add_wall(_vb, _realx + GFX_TILE_SIZE, _realy, 0, _realx + GFX_TILE_SIZE, _realy + GFX_TILE_SIZE, tilesWallHeight, _tilegfx, c_white, 1.0);
            break;
    }
*/
