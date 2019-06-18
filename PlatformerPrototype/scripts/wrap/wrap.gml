/// @description wrap(border)
/// @param border
///returns true if wrapped
var a = argument0;
var result = false;
if (x < -a)
{
    x = room_width+a;
    result = true;
}
else
if (x > room_width+a)
{
    x = -a;
    result = true;
}
if (y < -a)
{
    y = room_height+a;
    result = true;
}
else
if (y > room_height+a)
{
    y = -a;
    result = true;
}
return result;

