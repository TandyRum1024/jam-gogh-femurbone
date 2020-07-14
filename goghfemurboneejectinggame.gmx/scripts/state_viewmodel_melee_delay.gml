/// Viewmodel delay animation
if (!fsmStateInit)
{
    viewmodel_reset_params();
    modelx = animMeleeSwingX2;
    modely = animMeleeSwingY1;
    modelRot = animMeleeSwingR2;
    modelSkew = animMeleeSwingSkew2;
}
else
{
    var _maxtime = owner.weapon.usedelay;
    var _interp = interp_weight(fsmStateCtr, _maxtime, 1.0, 4.0); // 0.0 -> 1.0
    modelx = lerp(animMeleeSwingX2, animIdleX, _interp);
    modely = lerp(animMeleeSwingY1, animIdleY, _interp);
    modelSkew   = lerp(animMeleeSwingSkew2, animIdleSkew, _interp);
    modelRot    = lerp(animMeleeSwingR2, animIdleRot, _interp);
    
    // Check for animation switch
    if (fsmStateCtr > _maxtime)
    {
        fsm_set_state("idle");
    }
}
