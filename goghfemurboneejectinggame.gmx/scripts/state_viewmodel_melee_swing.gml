/// Viewmodel attack animation
if (!fsmStateInit)
{
    viewmodel_reset_params();
    modelx = animMeleeSwingX1;
    modely = animMeleeSwingY1;
    modelSkew = animMeleeSwingSkew1;
    animFXSwayIntensity = 1;
}
else
{
    var _maxtime = owner.weapon.usespeed;
    var _interp         = interp_weight(fsmStateCtr, _maxtime, 2.0, 4.0); // 0.0 -> 1.0
    var _interpraw      = clamp(fsmStateCtr / _maxtime, 0.0, 1.0); // interp with no weight
    var _interpbounce   = lerp(_interpraw, 1.0 - _interpraw, _interpraw) * 2.0; // 0.0 -> 1.0 -> 0.0
    modelx = lerp(animMeleeSwingX1, animMeleeSwingX2, _interp);
    modely = lerp(animMeleeSwingY1, animMeleeSwingY2, _interpbounce);
    modelSkew   = lerp(animMeleeSwingSkew1, animMeleeSwingSkew2, _interp);
    modelRot    = lerp(animMeleeSwingR1, animMeleeSwingR2, _interp);
    
    // Check for animation switch
    /*
    if (fsmStateCtr > _maxtime)
    {
        fsm_set_state("idle");
    }
    */
}
