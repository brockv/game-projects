/// @description rotate_smooth(start_direction,end_direction,speed);
/// @param start_direction
/// @param end_direction
/// @param speed

/*
    NOTE: Over the years of using and adapting the following code,
    it appears I've lost the name of the original author and thus I cannot
    credit him/her. If you are the author of the code, let me know so I
    can credit you properly!
*/

whole = 360;
return argument0 + sign(sin(degtorad(argument1 - argument0))) * (argument2 / (whole / 2)) * abs(((((argument0 - argument1) % whole) + (whole * 1.5)) % whole) - (whole / 2));
