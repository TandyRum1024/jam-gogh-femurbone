#define fsm_init
/// fsm_init()
/*
    initializes FSM
*/

fsmStates = ds_map_create(); // map holding the pair of states and it's script
fsmStateCurrentScripts = -1; // variable that holds the array of scripts
fsmStateCurrent = "default"; // current state's name
fsmStateNext    = "default"; // next state's name
fsmStatePrev    = "default"; // previous state's name
fsmStateInit    = false; // flag for first frame of state
fsmStateCtr     = 0; // frames elapsed since start of the current state

#define fsm_add_state
/// fsm_add_state(_name, _script1, _scrpit2, _script3...)
/*
    adds & links FSM's state to script that's provided
*/
var _scripts = -1;
for (var i=1; i<argument_count; i++)
{
    _scripts[i - 1] = argument[i];
}

ds_map_add(fsmStates, argument[0], _scripts);

#define fsm_set_state
/// fsm_set_state(_name)
/*
    switches FSM's current state to given state on next FSM update
*/

var _name = argument0;
fsmStateNext = _name;

#define fsm_exec
/// fsm_exec(_scriptindex)
/*
    executes current state's nth script indexed by script index
*/
var _scriptindex = argument0;

// Check if current state's script list is smaller than given index / not an array
if (fsmStateCurrentScripts == undefined || !is_array(fsmStateCurrentScripts))
{
    debug_trace("!! fsm_exec [", object_get_name(object_index), "] > STATE '", fsmStateCurrent, "' HAS NO SCRIPT CONNECTED :(");
    return false;
}
else if (array_length_1d(fsmStateCurrentScripts) <= _scriptindex)
{
    debug_trace("!! fsm_exec [", object_get_name(object_index), "] > SCRIPT INDEX OUT OF BOUNDS : INDEX [", _scriptindex, "] | SCRIPT LIST SIZE [", array_length_1d(fsmStateCurrentScripts), "]");
    return false;
}

// Otherwise execute the script
script_execute(fsmStateCurrentScripts[@ _scriptindex]);
return true;

#define fsm_update
/// fsm_update()
/*
    updates FSM, executing 1th script
*/

// Check for state switches
// if next state is different then switch to that state
if (fsmStateCurrent != fsmStateNext)
{
    fsmStatePrev = fsmStateCurrent;
    fsmStateCurrent = fsmStateNext;
    fsmStateInit = false;
    fsmStateCtr = 0;
}

// (fetch scripts from states map)
fsmStateCurrentScripts = fsmStates[? fsmStateCurrent];

// Execute state's script
fsm_exec(0);

// Increment state counter
fsmStateCtr++;

// Update state's first frame flag
fsmStateInit = true;

#define fsm_destroy
/// fsm_destroy()
/*
    Destroys instance's FSM
*/
ds_map_destroy(fsmStates);