/// Viewmodel idle animation
if (!fsmStateInit)
{
    viewmodel_reset_params();
}

modelx = animIdleX;
modely = animIdleY;
modelRot = animIdleRot;
modelSkew = animIdleSkew;

// Check for animation switches
var _vel = point_distance(0, 0, owner.vx, owner.vy);
if (_vel > 0.001)
{
    fsm_set_state("move");
}
