vertex_begin(tilesVB, oRenderMan.vertFormat);

// Iterate through all the tiles in grid & add floor or wall
var _first = true;
for (var _x=0; _x<tilesWid; _x++)
{
    for (var _y=0; _y<tilesHei; _y++)
    {
        vb_add_tile(tilesVB, _x, _y, _first);
        _first = false;
    }
}

vertex_end(tilesVB);
vertex_freeze(tilesVB);
