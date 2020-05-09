/// @function						Aura_Shadow_Caster_Rect_Init(half_width, half_height, [length]);
/// @description					Create a box shaped shadow caster based on the given half width/height
/// @param {real}	half_width		Half the width of the rectangular shadow you want to make
/// @param {real}	half_height		Half the height of the rectangular shadow you want to make
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

// This assigns a rectangular shadow to the instance calling the script. You supply the 
// half width and height and the shadow will be calculated using that around the position
// of the instance in the room. Note that the script has an optional "length" argument 
// so you can tell Aura the length multiplier to use for the shadow.

// Number of shadow points
aura_shadow_points = 4;

// Add the points to the shadow caster array
aura_shadow_x[0] = -argument[0];
aura_shadow_y[0] = -argument[1];

aura_shadow_x[1] = argument[0];
aura_shadow_y[1] = -argument[1];

aura_shadow_x[2] = argument[0];
aura_shadow_y[2] = argument[1];

aura_shadow_x[3] = -argument[0];
aura_shadow_y[3] = argument[1];

for (var i = 0; i < 4; i++;)
{
aura_shadow_xylen[i] = point_distance(0, 0, aura_shadow_x[i], aura_shadow_y[i]);
aura_shadow_xydir[i] = point_direction(0, 0, aura_shadow_x[i], aura_shadow_y[i]);
}

// EXPERIMENTAL! This will set the length of the shadow cast by lights
// To be honest, I'm not too happy with how this looks and recommend 
// that it'snot used, but it may be useful to some people or for specific
// effects...

aura_shadow_length = 100000;

if argument_count > 2
{
aura_shadow_length = argument[0];
}
