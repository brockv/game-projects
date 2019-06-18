/// @function					Aura_Shadow_Caster_Poly_Init([length]);
/// @description				Initialise a polygon shadow caster
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

// After initialising the polygon shadow caster, you must then call the script
// "Aura_Shadow_Caster_Poly_Add_Point" to add the points of the poligon in CLOCKWISE order.
// Note that the script has an optional "length" argument so you can tell Aura the length 
// multiplier to use for the shadow.

// Initialise the shadow caster points variable
aura_shadow_points = 0;

// EXPERIMENTAL! This will set the length of the shadow cast by lights
// To be honest, I'm not too happy with how this looks and recommend 
// that it'snot used, but it may be useful to some people or for specific
// effects...

aura_shadow_length = 100000;
if argument_count > 0
{
aura_shadow_length = argument[0];
}


