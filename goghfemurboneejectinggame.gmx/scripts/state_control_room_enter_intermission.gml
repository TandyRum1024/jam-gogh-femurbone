/// state_control_room_enter()
/*
    Intermission room enter handling state
*/
// Clear all gameplay elements
instance_destroy(oGameplay);

// Load starting room into the room object
oRoom.tilesRaw = oGamevars.dataRoomBegin;

// Request room to build the level
with (oRoom)
{
    event_user(0);
}

if (!instance_exists(oPlayer))
{
    // Spawn the player in random player spawn point in the starting room
    var _playerspawnnum = ds_list_size(oRoom.tilesPlayerspawners) - 1;
    var _currentspawner = oRoom.tilesPlayerspawners[| irandom_range(0, _playerspawnnum)];
    var _spawnerx = _currentspawner[@ 0] * GFX_TILE_SIZE + GFX_TILE_SIZE * 0.5;
    var _spawnery = _currentspawner[@ 1] * GFX_TILE_SIZE + GFX_TILE_SIZE * 0.5;
    instance_create(_spawnerx, _spawnery, oPlayer);
}
else
{
    // Re-spawn & reset the player in random player spawn point in the starting room
    var _playerspawnnum = ds_list_size(oRoom.tilesPlayerspawners) - 1;
    var _currentspawner = oRoom.tilesPlayerspawners[| irandom_range(0, _playerspawnnum)];
    var _spawnerx = _currentspawner[@ 0] * GFX_TILE_SIZE + GFX_TILE_SIZE * 0.5;
    var _spawnery = _currentspawner[@ 1] * GFX_TILE_SIZE + GFX_TILE_SIZE * 0.5;
    
    with (oPlayer)
    {
        // Reset FSM and HP to normal
        fsm_set_state("normal");
        hp = hpMax;
        
        // Give default weapon to player
        if (instance_exists(weapon))
            instance_destroy(weapon);
        weapon = instance_create(0, 0, oWeapon);
        weapon.owner = id;
        
        // Reset weapon state
        with (weapon)
        {
            fsm_set_state("melee_idle");
        }
        
        // Reset camera & viewmodel
        viewmodel.drawViewmodel = true;
        height = oGamevars.metaPlayerHeight;
        
        // Teleport to random spawnpoint
        x = _spawnerx;
        y = _spawnery;
    }
}

// Reset scores
gameScore = 0;

// Switch to next state : intermission
fsm_set_state("intermission");

// Reset tutorial 
intermissionShowInfo = true;
intermissionMoved    = 0;

// Display message
// ui_show_msg("VAN GOGH FEMURBONE EJECTION ANECDOTE", room_speed * 3);
