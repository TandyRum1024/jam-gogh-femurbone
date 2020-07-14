// Update player movement
var _ismoving = (inputH != 0 || inputV != 0);
if (_ismoving)
{
    // (apply acceleration)
    if (inputV != 0) // forward/backward
    {
        mv_accelerate_vec(oCamera.vecFx * inputV, oCamera.vecFy * inputV, moveVelAccel, moveVelMax);
    }
    if (inputH != 0) // sidestep
    {
        // mv_accelerate(_dir, moveVelAccel, moveVelMax);
        mv_accelerate_vec(oCamera.vecRx * inputH, oCamera.vecRy * inputH, moveVelAccel, moveVelMax);
    }
    
    // (apply 'step' acceleration)
    var _vel = point_distance(0, 0, vx, vy);
    if (_vel < moveVelStepMax)
    {
        if (inputVPress != 0)
        {
            vx += oCamera.vecFx * inputVPress * moveVelStepAccel;
            vy += oCamera.vecFy * inputVPress * moveVelStepAccel;
        }
        if (inputHPress != 0)
        {
            vx += oCamera.vecRx * inputHPress * moveVelStepAccel;
            vy += oCamera.vecRy * inputHPress * moveVelStepAccel;
        }
    }
}

var _vel = ((point_distance(0, 0, vx, vy) / moveVelMax) / 60) * 2 * pi;
moveCtr += _vel;
