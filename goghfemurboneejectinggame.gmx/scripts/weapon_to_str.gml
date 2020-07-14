/// weapon_to_str(_wep)
/*
    Returns string description / representation of given weapon
*/

var _wep = argument0;
var _str = "";

switch (_wep.type)
{
    case eWEAPON.MELEE:
        _str =
        "DMG : " + string(_wep.damage) +
        "#RANGE : " + string(_wep.attackdist) +
        "#SWING SPD. : " + string(_wep.usespeed) +
        "#CLDN. TIME : " + string(_wep.usedelay) +
        "#CHARGE TIME : " + string(_wep.usewindup);
        break;
        
    case eWEAPON.KEY:
        _str = "IT'S A KEY!!#USE IT TO UNLOCK DOORS!";
        break;
}

return _str;
