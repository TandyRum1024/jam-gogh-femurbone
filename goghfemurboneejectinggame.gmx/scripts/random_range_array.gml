#define random_range_array
/// random_range_array(_array)
/*
    returns random value between first two values in given array
*/
var _array = argument0;
return random_range(_array[@ 0], _array[@ 1]);

#define irandom_range_array
/// irandom_range_array(_array)
/*
    returns random value between first two values in given array
*/
var _array = argument0;
return irandom_range(_array[@ 0], _array[@ 1]);