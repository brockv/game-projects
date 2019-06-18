/// @function						Aura_Light_Get_Enabled(light_instance);
/// @description					Return "true" or "false" depending on wthether the light is flagged as enabled or not
/// @param {real}	light_instance	The instance to get the enabled flag from

// This getter script returns true (1) if the instance is currently enabled or 
// "false" (0) if it is not. If the instance doesn't exist, it will return 
// "noone" (-4), or if the instance doesn't have the light variable (it's 
// not a light instance or isn't a child of one of the light parent objects)
// then it will return -1.

if instance_exists(argument0)
{
if variable_instance_exists(argument0, "aura_light_enabled")
	{
	return argument0.aura_light_enabled;
	}
else return -1;
}
else return noone;