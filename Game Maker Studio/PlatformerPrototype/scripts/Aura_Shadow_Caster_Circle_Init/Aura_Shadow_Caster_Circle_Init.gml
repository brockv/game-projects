/// @function					Aura_Shadow_Caster_Circle_Init(precision, radius_, [length]);
/// @description				Create a circular shadow caster
/// @param {real}	precision	The precision with which to generate the shadow caster vertex data (min: 4)
/// @param {real}	radius_		The radius_ of the shadow caster
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

// It is assumed that the x/y of the shadow caster instance sprite is centered
// (if you use a sprite, but this is not required) and a precision of 8 is usually fine
// but you may need to make it higher for larger sprites / circles. Note that the script has an 
// optional "length" argument so you can tell Aura the length multiplier to use for the shadow.

// Initialise instance variables
aura_shadow_points = 0;

// Set base circle vars
var a_prec = argument[0];
var a_rad = argument[1];
var a_ang = 360 / a_prec;
var a_xx = 0;
var a_yy = 0;

// Add vertices
for (var i = 0; i <= 360; i += a_ang;)
{
aura_shadow_x[aura_shadow_points] = lengthdir_x(a_rad, i);
aura_shadow_y[aura_shadow_points] = lengthdir_y(a_rad, i);
aura_shadow_xylen[aura_shadow_points] = point_distance(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);
aura_shadow_xydir[aura_shadow_points] = point_direction(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);
++aura_shadow_points;
}

// EXPERIMENTAL! This will set the length of the shadow cast by lights
// To be honest, I'm not too happy with how this looks and recommend 
// that it'snot used, but it may be useful to some people or for specific
// effects...

aura_shadow_length = 100000;

if argument_count > 2
{
aura_shadow_length = argument[2];
}