/// @function						Aura_Light_Set_Alpha(light_instance, alpha);
/// @description					Set the alpha of a light caster instance
/// @param {real}	light_instance	The instance to set the alpha of
/// @param {bool}	alpha			The new alpha value (0 - 1)

// This setter script permits you to set the alpha variable for a light caster.
// You supply the light instance to set, and then the alpha value, which must be
// greater than 0. If the funtion fails because the instance given doesn't exist, 
// then it will return "noone" (-4), or if the instance doesn't have the variable
// (ie: it is not a light caster instance) it will return -1. If it is successful 
// then it will return "true" (1).

// Note that this is essentially a "free" change to make and you can set the colour
// and alpha for a light with no performance hit or changes to the surface.

if instance_exists(argument0)
{
if variable_instance_exists(argument0, "aura_light_update")
	{
	argument0.aura_light_colour = clamp(argument1, 0 , 1);
	return true;
	}
else return -1;
}
else return noone;