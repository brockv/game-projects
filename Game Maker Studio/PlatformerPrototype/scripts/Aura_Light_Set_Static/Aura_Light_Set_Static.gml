/// @function						Aura_Light_Set_Static(light_instance, flag);
/// @description					Set a light instance to be static or not
/// @param {real}	light_instance	The instance to set the static flag on
/// @param {bool}	flag			The static flag (set to true or false)

// This setter script permits you to set the static variable for a light caster.
// You supply the light instance to set, and then the flag value, where "true" (1)
// is static and "false" (0) is dynamic. If the funtion fails because the instance
// given doesn't exist, it will return "noone" (-4), or if the instance doesn't have 
// the variable (ie: it is not a light caster instance) it will return -1. If it is
// successful then it will return "true" (1).

// Note that setting the light to dynamic will ALSO set the "aura_light_update" 
// variable to "true".

if instance_exists(argument0)
{
if variable_instance_exists(argument0, "aura_light_static")
	{
	argument0.aura_light_static = argument1;
	if argument0 == false
		{
		argument0.aura_light_update = true;
		}
	return true;
	}
else return -1;
}
else return noone;