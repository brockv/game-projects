/// @function						Aura_Light_Set_Update(light_instance, flag);
/// @description					Set a light instance to update or not
/// @param {real}	light_instance	The instance to set the update flag on
/// @param {bool}	flag			The update flag (set to true or false)

// This setter script permits you to set the update variable for a light caster.
// You supply the light instance to set, and then the flag value, where "true" (1)
// is updating and "false" (0) is no update. If the funtion fails because the instance
// given doesn't exist, it will return "noone" (-4), or if the instance doesn't have 
// the variable (ie: it is not a light caster instance) it will return -1. If it is
// successful then it will return "true" (1).

// Note that setting this to "true" on a STATIC light will only work for one step 
// before being automatically set to "false" again. Also note that switching update
// to "false" for a DYNAMIC light will prevent it from updating too, essentially
// converting a dynmaic light into a static one, but without using the static flag. 

if instance_exists(argument0)
{
if variable_instance_exists(argument0, "aura_light_update")
	{
	argument0.aura_light_update = argument1;
	return true;
	}
else return -1;
}
else return noone;