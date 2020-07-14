/// weapon_replace(_inst, _wep)
/*
    Gives given weapon instance to provided instance and deletes original weapon instance
*/

var _inst = argument0, _wep = argument1;

if (!instance_exists(_inst))
    return false;

// Delete
if (instance_exists(_inst.weapon))
    instance_destroy(_inst.weapon);
// Replace
_inst.weapon = _wep;
_wep.owner = _inst;

// Set weapon state to idle for appropirate idle states
with (_wep)
{
    fsm_set_state("idle");
}
return true;
