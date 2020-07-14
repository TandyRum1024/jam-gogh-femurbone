/// state_control_room_enter()
/*
    Room enter handling state
*/
global.gamePaused = false;

// Clear all gameplay elements
instance_destroy(oGameplay);

// Load room / randomly select room & feed it into room handler's room data
randomize();
var _roomdata = oGamevars.dataRoomPool[| irandom_range(0, ds_list_size(oGamevars.dataRoomPool) - 1)];

// (feed it into room handler)
oRoom.tilesRaw = _roomdata;

with (oRoom)
{
    // (request room to build the level)
    event_user(0);
    
    // (build flavour text for room)
    event_user(2);
}

// Teleport the player in random door location
if (instance_exists(oPlayer))
{
    // Find the random door in the room and get its coordinates
    var _doorinst = instance_find(oDoor, instance_number(oDoor) - 1);
    var _spawnx = oRoom.tilesWid * 0.5 * GFX_TILE_SIZE;
    var _spawny = oRoom.tilesHei * 0.5 * GFX_TILE_SIZE;
    if (instance_exists(_doorinst))
    {
        _spawnx = _doorinst.x;
        _spawny = _doorinst.y;
        
        // delete the door
        /*
        with (_doorinst)
        {
            event_user(0);
        }
        */
        instance_destroy(_doorinst);
    }
    
    // (reset player door interaction flag)
    oPlayer.interactDoorUsed = false;
    
    // (teleport player)
    oPlayer.x = _spawnx;
    oPlayer.y = _spawny;
}

// Switch to next state
fsm_set_state("ingame");

// Also display flavour text
ui_show_msg(oRoom.flavourText, room_speed * 2);

// Increment score
gameScore++;
