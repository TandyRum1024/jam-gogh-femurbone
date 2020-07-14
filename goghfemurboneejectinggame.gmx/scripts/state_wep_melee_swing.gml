#define state_wep_melee_swing
/// weapon melee swing state
if (!fsmStateInit)
{
    // Create melee swing hitbox
    if (instance_exists(meleeHitbox))
        instance_destroy(meleeHitbox);
        
    if (owner.object_index == oPlayer)
        meleeHitbox = instance_create(x, y, oMeleePlayer);
    else
        meleeHitbox = instance_create(x, y, oMeleeMob);
    meleeHitbox.owner = id;
    
    // Create melee disarm/stun hitbox
    var _stunbox = instance_create(owner.x, owner.y, oStunZone);
    _stunbox.owner = id;
    _stunbox.life = 3;
    _stunbox.image_xscale = attackdist / 32;
    _stunbox.image_yscale = attackdist / 32;
    
    // Player advantage : stun hitbox lasts more (8 frames vs 3 frame) and has a bigger size
    if (owner.object_index == oPlayer)
    {
        _stunbox.life = 8;
        _stunbox.image_xscale *= 1.2;
        _stunbox.image_yscale *= 1.2;
    }
    
    // Play sfx : swing sound
    var _swingsnd = sndSwing1;
    // Determine swing sounds from swing velocity
    if (usespeed < room_speed * 0.25)
        _swingsnd = sndSwing3;
    else if (usespeed < room_speed * 0.5)
        _swingsnd = sndSwing2;
    
    sfx_emit(_swingsnd, 1.0, random_range(0.95, 1.05));
    
    show_debug_message("HITBOX DEPLOY");
}
else
{
    // Check if owner exists
    if (!instance_exists(owner))
        return 0;
    
    // Update hitbox
    var _interp = interp_weight(fsmStateCtr, usespeed, 3.0, 2.0);
    if (owner.object_index == oPlayer)
        var _weprot = plr_convert_direction(owner) + lerp(-90, 90, _interp);
    else
        var _weprot = owner.lookDir + lerp(-90, 90, _interp);
    meleeHitbox.x = owner.x + lengthdir_x(2, _weprot);
    meleeHitbox.y = owner.y + lengthdir_y(2, _weprot);
    meleeHitbox.image_xscale    = attackdist;
    meleeHitbox.image_angle     = _weprot;
    meleeHitbox.damage = damage;
    meleeHitbox.knockback = knockback;
    
    // Sync the hitbox and model if enemy is holding this weapon
    if (owner.object_index != oPlayer)
    {
        x = meleeHitbox.x;
        y = meleeHitbox.y;
        z = 2;
        modelRot[@ 2] = meleeHitbox.image_angle;
    }
    
    // Check if the swing has been ended
    if (fsmStateCtr > usespeed)
    {
        fsm_set_state("melee_delay");
        
        // Play animation on owner instance's viewmodel
        if (owner.object_index == oPlayer)
        {
            with (owner.viewmodel)
            {
                fsm_set_state("melee_delay");
            }
        }
    }
}

// On state exit, destroy melee hitbox
if (fsmStateNext != "melee_swing")
{
    show_debug_message("HITBOX DESTROY");
    if (instance_exists(meleeHitbox))
        instance_destroy(meleeHitbox);
}

#define state_wep_melee_delay
/// weapon melee delay state
if (!fsmStateInit)
{
    if (instance_exists(meleeHitbox))
        instance_destroy(meleeHitbox);
}
else
{
    // Check if the delay has been ended
    if (fsmStateCtr > usedelay)
    {
        fsm_set_state("idle");
    }
}

#define state_wep_melee_idle
/// weapon melee idle state
if (!fsmStateInit)
{
    if (instance_exists(meleeHitbox))
        instance_destroy(meleeHitbox);
    
    // Play sfx : weapon ready
    sfx_emit(sndSwordReady, 1.0, random_range(0.95, 1.05));
}
else
{
    // Check if owner exists
    if (!instance_exists(owner))
        return 0;
    
    // Update model if enemy is holding this weapon
    if (owner.object_index != oPlayer)
    {
        x = owner.x + lengthdir_x(2, owner.lookDir - 90);
        y = owner.y + lengthdir_y(2, owner.lookDir - 90);
        z = 2;
        modelRot[@ 2] = owner.lookDir;
    }
    
    // Check for attack / activation request
    if (activateRequestHold || activateRequest)
    {
        fsm_set_state("melee_windup");
        
        // Play animation on owner instance's viewmodel
        if (owner.object_index == oPlayer)
        {
            with (owner.viewmodel)
            {
                fsm_set_state("melee_windup");
            }
        }
    }
}

#define state_wep_melee_stun
/// weapon melee stun state
if (!fsmStateInit)
{
    if (instance_exists(meleeHitbox))
        instance_destroy(meleeHitbox);
        
    // Play sfx : stun impact
    sfx_emit(sndImpact, 1.0, random_range(0.9, 1.1));
}
else
{
    // Check for state switch
    var _maxtime;
    if (owner.object_index == oPlayer)
        _maxtime = oGamevars.metaWeaponFSMStunDurationPlayer;
    else
        _maxtime = oGamevars.metaWeaponFSMStunDurationEnemy;
    
    if (fsmStateCtr > _maxtime)
    {
        fsm_set_state("melee_idle");
    }
}

#define state_wep_melee_windup
/// weapon melee windup state
if (!fsmStateInit)
{
    if (instance_exists(meleeHitbox))
        instance_destroy(meleeHitbox);
        
    // Play sfx : weapon wind-up
    sfx_emit(sndSwordWindup, 1.0, random_range(0.95, 1.05));
}
else
{
    // Check for state switch
    // User is not holding down the attack and the wind-up time has passed
    if (fsmStateCtr > usewindup && !activateRequestHold)
    {
        fsm_set_state("melee_swing");
        
        // Play animation on owner instance's viewmodel
        if (owner.object_index == oPlayer)
        {
            with (owner.viewmodel)
            {
                fsm_set_state("melee_swing");
            }
        }
    }
}