/// debug_trace(a, b, c...)
/*
    Automatically builds the string from arguments and passes the string it to show_debug_message()
*/

var _str = "";
for (var i=0; i<argument_count; i++)
{
    _str += string(argument[i]);
}

show_debug_message(_str);
return _str;
