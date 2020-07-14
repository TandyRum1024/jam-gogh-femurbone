/// Viewmodel windup animation
if (!fsmStateInit)
{
    viewmodel_reset_params();
    modelx = animMeleeWindupX1;
    modely = animMeleeWindupY1;
    modelRot = animMeleeWindupR1;
    modelSkew = animMeleeWindupSkew1;
}
else
{
    var _maxtime    = owner.weapon.usewindup;
    var _interp     = interp_weight(fsmStateCtr, _maxtime, 3.0, 1.0); // 0.0 -> 1.0
    modelx = lerp(animMeleeWindupX1, animMeleeWindupX2, _interp);
    modely = lerp(animMeleeWindupY1, animMeleeWindupY2, _interp);
    modelRot    = lerp(animMeleeWindupR1, animMeleeWindupR2, _interp);
    modelSkew   = lerp(animMeleeWindupSkew1, animMeleeWindupSkew2, _interp);
}
