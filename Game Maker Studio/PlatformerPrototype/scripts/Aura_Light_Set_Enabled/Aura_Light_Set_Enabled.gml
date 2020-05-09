/// @function						Aura_Light_Set_Enabled(light_instance, flag);
/// @description					Set a light instance to be enabled or not
/// @param {real}	light_instance	The instance to set the enabled flag on
/// @param {bool}	flag			The enabled flag (set to true or false)

// This setter script permits you to set the update variable for a light caster.
// You supply the light instance to set, and then the flag value, where "true" (1)
// is enabled and "false" (0) is disbled. If the funtion fails because the instance
// given doesn't exist, it will return -4, or if the instance doesn't have the 
// variable (ie: it is not a light caster instance) it will return -1. If it is
// successful then it will return "true" (1).

if instance_exists(argument0)
{
if variable_instance_exists(argument0, "aura_light_enabled")
	{
	argument0.aura_light_enabled = argument1;
	return true;
	}
else return -1;
}
else return noone;