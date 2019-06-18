/// @function						Aura_Light_Set_Radius(light_instance, radius, [scale]);
/// @description					Set the radius of a light caster instance
/// @param {real}	light_instance	The instance to set the radius of
/// @param {real}	radius			The new radius value
/// @param {bool}	scale			OPTIONAL! Whetner to scale the sprite too or not

// This setter script permits you to set the radius variable for a light caster.
// You supply the light instance to set, and then the radius value, which must be
// greater than 0. If the funtion fails because the instance given doesn't exist, 
// then it will return "noone" (-4), or if the instance doesn't have the variable
// (ie: it is not a light caster instance) it will return -1. If it is successful 
// then it will return "true" (1), and if it fails because the surface couldn't be 
// initialised it returns "false".

// Note, when you change the light radius yu are destroying and recreating the 
// light surface and as such the variable "aura_light_update" will be set to 
// true as well so the surface gets the updated shadow mesh for the new radius.
// Also note that there is an optional scale argument that when set to true will 
// also set the light sprite to be scaled to fit the new surface size (this ONLY 
// WORKS WITH SPRITES THAT HAVE THE ORIGIN CENTERED!).

if instance_exists(argument[0])
{
if variable_instance_exists(argument[0], "aura_light_radius")
	{
	with (argument[0])
		{
		aura_light_radius = argument[1];
		// Compensate for greater/smaller radius of the light than the sprite
		if argument_count > 2
			{
			if argument[2]
				{
				image_xscale = (aura_light_radius * 2) / sprite_get_width(sprite_index);
				image_yscale = (aura_light_radius * 2) / sprite_get_height(sprite_index);
				}
			}
		if surface_exists(aura_light_surface)
			{
			surface_free(aura_light_surface);
			}
		aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);
		if surface_exists(aura_light_surface)
			{
			surface_set_target(aura_light_surface);
			draw_clear_alpha(c_black, 1);
			surface_reset_target();
			}
		else return false;
		aura_light_update = true;
		}
	return true;
	}
else return -1;
}
else return noone;