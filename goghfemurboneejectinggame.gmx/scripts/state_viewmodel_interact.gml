/// Viewmodel interact animation
if (!fsmStateInit)
{
    viewmodel_reset_params();
    modelx = 0;
    modely = animInteractY2;
    modelz = 0;
    modelSkew = animInteractSkew2;
    animFXSwayIntensity = 2;

}
else
{
    var _interp = interp_weight(fsmStateCtr, animInteractTime, 2.0, 4.0);
    modelx = 0;
    modely = lerp(animInteractY2, animInteractY1, _interp);
    modelz = 0;
    modelSkew = lerp(animInteractSkew2, animInteractSkew1, _interp);
    animFXSwayIntensity = lerp(2.0, 1.0, _interp);
    
    // Check for animation switch
    if (fsmStateCtr > animInteractTime)
    {
        fsm_set_state("idle");
    }
}
