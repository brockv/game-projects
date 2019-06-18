/// @function						Aura_Light_Get_Radius(light_instance);
/// @description					Get the radius of the light for the instance
/// @param {real}	light_instance	The instance to get the radius of

// This getter script returns the radius of the given light source instance
// If the instance doesn't exist, then "noone" (-4) will be retuned. If the
// instance doesn't have the light variable (it's not a light instance or 
// isn't a child of one of the light parent objects) then it will return -1,
// otherwise it will return the radius of the light source.

if instance_exists(argument0)
{
if variable_instance_exists(argument0, "aura_light_radius")
	{
	return argument0.aura_light_radius;
	}
else return -1;
}
else return noone;