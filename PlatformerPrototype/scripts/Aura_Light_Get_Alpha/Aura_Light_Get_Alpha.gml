/// @function						Aura_Light_Get_Alpha(light_instance);
/// @description					Get the alpha of the light for the instance
/// @param {real}	light_instance	The instance to get the alpha of

// This getter script returns the alpha of the given light source instance
// If the instance doesn't exist, then "noone" (-4) will be retuned. If the
// instance doesn't have the light variable (it's not a light instance or 
// isn't a child of one of the light parent objects) then it will return -1,
// otherwise it will return the alpha of the light source.

if instance_exists(argument0)
{
if variable_instance_exists(argument0, "aura_light_alpha")
	{
	return argument0.aura_light_alpha;
	}
else return -1;
}
else return noone;