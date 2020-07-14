/// control_transition_to(_time, _dest)
/*
    initiates transition to destination state
*/
var _time = argument0, _dest = argument1;
transitionTime = _time;
transitionDest = _dest;

transitionInProgress = true;
transitionFadeOut = true;
