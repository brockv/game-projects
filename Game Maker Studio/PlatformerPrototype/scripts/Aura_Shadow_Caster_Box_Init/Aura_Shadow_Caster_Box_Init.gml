/// @function					Aura_Shadow_Caster_Box_Init([length]);
/// @description				Create a box shaped shadow caster based on the current sprite
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

// Assign a box shadow based on the sprite bounding box of the sprite assigned to the instance
// This takes into consideration any scaling done in the room editor, or using the image_x/yscale
// (as long as they have been set previously to calling this script). Note that the script has an 
// optional "length" argument so you can tell Aura the length multiplier to use for the shadow.

// Number of shadow points
aura_shadow_points = 4;

// Add the points to the shadow caster array
aura_shadow_x[0] = bbox_left - x;
aura_shadow_y[0] = bbox_top - y;

aura_shadow_x[1] = (bbox_right + 1) - x;
aura_shadow_y[1] = bbox_top - y;

aura_shadow_x[2] = (bbox_right + 1) - x;
aura_shadow_y[2] = (bbox_bottom + 1)- y;

aura_shadow_x[3] = bbox_left - x;
aura_shadow_y[3] = (bbox_bottom + 1) - y;

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

if argument_count > 0
{
aura_shadow_length = argument[0];
}