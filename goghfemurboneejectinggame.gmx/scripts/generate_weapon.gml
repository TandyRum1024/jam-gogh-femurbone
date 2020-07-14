#define generate_weapon
/// generate_weapon()
/*
    Generates weapons with random stats
*/

var _wep = instance_create(0, 0, oWeapon);

// 1] Determine weapon type & subtype
var _weptype = eWEAPON.MELEE; // irandom_range(0, eWEAPON.END);
var _subtype = 0;
switch (_weptype)
{
    case eWEAPON.MELEE:
        _subtype = irandom_range(0, eWEAPON_MELEE.END);
        break;
    case eWEAPON.RANGED:
        _subtype = irandom_range(0, eWEAPON_RANGED.END);
        break;
}

// (assign to weapon)
_wep.type       = _weptype;
_wep.subtype    = _subtype;

// 2] Determine weapon properties
var _dmg        = irandom_range_array(oGamevars.metaWeaponDamageRange);
var _knockback  = random_range_array(oGamevars.metaWeaponKnockbackRange);
// (assign to weapon)
_wep.damage     = _dmg;
_wep.knockback  = _knockback;
switch (_weptype)
{
    case eWEAPON.MELEE:
        // melee-specific properties
        var _speed  = irandom_range_array(oGamevars.metaWeaponMeleeSpeedRange);
        var _delay  = irandom_range_array(oGamevars.metaWeaponMeleeDelayRange);
        var _windup = irandom_range_array(oGamevars.metaWeaponMeleeWindupRange);
        var _dist   = random_range_array(oGamevars.metaWeaponMeleeDistRange);
        
        // (assign to weapon)
        _wep.usespeed = _speed;
        _wep.usedelay = _delay;
        _wep.usewindup = _windup;
        _wep.attackdist = _dist;
        break;
    case eWEAPON.RANGED:
        // ranged-specific properties
        var _delay  = irandom_range_array(oGamevars.metaWeaponRangedDelayRange);
        var _recoil = random_range_array(oGamevars.metaWeaponRangedRecoilRange);
        var _vel    = random_range_array(oGamevars.metaWeaponRangedVelRange);
        var _dist   = random_range_array(oGamevars.metaWeaponRangedDistRange);
        
        // ranged : burst fire? (more projectiles in one shot but distributed damage)
        var _shots = 1;
        if (random_range(0.0, 1.0) < oGamevars.metaWeaponRangedMultishotChance)
        {
            _shots = irandom_range_array(oGamevars.metaWeaponRangedShotsRange);
        }
        
        // (assign to weapon)
        _wep.usedelay       = _delay;
        _wep.rangedRecoil   = _recoil;
        _wep.attackdist = _dist;
        _wep.attackvel  = _vel;
        
        _wep.rangedShotsPerFire = _shots;
        break;
}

// 3] Determine weapon visuals
// _wep.spriteIdx = irandom_range(0, sprite_get_number(sprTiles) - 1);
_wep.modelScale = makearray(irandom_range_array(oGamevars.metaWeaponScaleRangeX), irandom_range_array(oGamevars.metaWeaponScaleRangeY));

if (random_range(0.0, 1.0) < oGamevars.metaWeaponVisualFlashChance)
{
    // Certain chance for the weapon to have a pulsating colour
    _wep.modelFlash = true;
    _wep.modelFlashColours = makearray(make_color_hsv(random_range(0, 255), random_range(128, 255), random_range(128, 255)), make_color_hsv(random_range(0, 255), random_range(128, 255), random_range(128, 255)));
}
else
{
    // Otherwise, Weapons gets a single random colour
    _wep.image_blend = make_color_hsv(random_range(0, 255), random_range(128, 255), random_range(64, 255));
}

return _wep;

#define generate_weapon_key
/// generate_weapon_key()
/*
    Generates key weapon type instance
*/
var _wep = instance_create(0, 0, oWeapon);
_wep.type = eWEAPON.KEY;
_wep.spriteIdx = 10;
_wep.modelFlash = true;
_wep.modelFlashColours = makearray(c_yellow, c_orange);
return _wep;