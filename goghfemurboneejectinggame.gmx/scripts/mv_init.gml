#define mv_init
/// mv_init()
/*
    Initializes moveable's physics variables
*/

// velocity
vx = 0;
vy = 0;

#define mv_update
/// mv_update()
/*
    Updates moveable's x & y position
*/

#define mv_accelerate
/// mv_accelerate(_dir, _accel, _maxvel)
/*
    Applies acceleration with given direction, acceleration, maximum velocity
*/

var _dir = argument0, _accel = argument1, _maxvel = argument2;

// Convert movement direction to unit direction vector : x / y component
var _dirx = dcos(_dir), _diry = dsin(_dir);

// Calculate velocity relative to movement direction by projecting velocity to direction vector
var _velcurrent = dot_product(_dirx, _diry, vx, vy);

// Calculate final acceleration that will be added to velocity
var _finalaccel = min(_accel, _maxvel - _velcurrent);

// Apply acceleration
vx += _dirx * _finalaccel;
vy += _diry * _finalaccel;

#define mv_accelerate_vec
/// mv_accelerate_vec(_dx, _dy, _accel, _maxvel)
/*
    Applies acceleration with given direction, acceleration, maximum velocity
*/

var _dx = argument0, _dy = argument1, _accel = argument2, _maxvel = argument3;

// Calculate velocity relative to movement direction by projecting velocity to direction vector
var _velcurrent = dot_product(_dx, _dy, vx, vy);

// Calculate final acceleration that will be added to velocity
var _finalaccel = min(_accel, _maxvel - _velcurrent);

// Apply acceleration
vx += _dx * _finalaccel;
vy += _dy * _finalaccel;

#define mv_update_x
/// mv_update_x()
/*
    Updates moveable's x position
*/

// Check for collision
var _sv = sign(vx); // signed velocity
var _movemaxstep = 8;
// if (map_check_collision_at(x + vx, y))
if (place_meeting(x + vx, y, oTileSolid))
{
    // while (!map_check_collision_at(x + _sv, y) && _movemaxstep > 0)
    while (!place_meeting(x + _sv, y, oTileSolid) && _movemaxstep > 0)
    {
        x += _sv;
        _movemaxstep--;
    }
    
    vx = 0;
}

// Update position
x += vx;

#define mv_update_y
/// mv_update_y()
/*
    Updates moveable's y position
*/

// Check for collision
var _sv = sign(vy); // signed velocity
var _movemaxstep = 8;
// if (map_check_collision_at(x, y + vy))
if (place_meeting(x, y + vy, oTileSolid))
{
    // while (!map_check_collision_at(x, y + _sv) && _movemaxstep > 0)
    while (!place_meeting(x, y + _sv, oTileSolid) && _movemaxstep > 0)
    {
        y += _sv;
        _movemaxstep--;
    }
    
    vy = 0;
}

// Update position
y += vy;