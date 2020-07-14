/// Viewmodel move animation
if (!fsmStateInit)
{
    viewmodel_reset_params();
    modelx = 0;
    modely = 0;
    modelz = 0;
    modelSkew = animIdleSkew;
    animFXSwayIntensity = 1;
}
else
{
    var _velfactor = point_distance(0, 0, owner.vx, owner.vy) / owner.moveVelMax;
    var _bobx = anim_cosinewave(0.85, animMoveBobAmp);
    var _boby = abs(anim_sinewave(1, animMoveBobAmp)) * -1 + 0.25;
    var _bobskew = anim_sinewave(2, animMoveSkewAmp);
    var _bobtilt = anim_cosinewave(1, animMoveTiltAmp);
    
    modelx = _bobx * _velfactor;
    modely = _boby * _velfactor;
    modelz = 0;
    
    modelSkew = lerp(animIdleSkew, animMoveSkew + _bobskew, _velfactor);
    modelTilt = _bobtilt * _velfactor;
    animFXSwayIntensity = lerp(1.0, 2.0, _velfactor);
    
    // Check for animation switch
    if (_velfactor < 0.001)
    {
        fsm_set_state("idle");
    }
}
