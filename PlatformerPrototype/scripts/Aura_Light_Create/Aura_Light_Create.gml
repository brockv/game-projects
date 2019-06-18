/// @function					Aura_Light_Create(layer, instance, sprite, index, x, y, radius, colour, alpha, static, visible);
/// @description				Create a new light source instance
/// @param {real}	layer		The layer (real or string) to create the light instance on
/// @param {real}	instance	The instance to create (must be a child of "o_aura_light_parent"
/// @param {real}	sprite		The sprite for the light to use (set to -1 for default instance sprite)
/// @param {real}	index		The image index of the sprite to use (set to -1 to use the index set by the instance)
/// @param {real}	x			The x position to create the light at
/// @param {real}	y			The y position to create the light at
/// @param {real}	radius		The radius of the light being created
/// @param {real}	colour		The colour of the light blending
/// @param {real}	alpha		The alpha of the light (0 - 1)
/// @param {bool}	static		Whether the light is static (set to true) or dynamic (false)
/// @param {bool}	visible		Whether the light is ebnabled and visible (set to true) or not (false)

// This is a convenience function for creating a light instance on a layer. It is 
// designed so that you simply need a aparent or generic light instance and use this 
// to set its properies on create. The script will return the ID of the new instance,
// or "noone" (-4) if it fails to create the instance.

if layer_exists(argument0)
{
var _id = instance_create_layer(argument4, argument5, argument0, argument1);
with (_id)
	{
	if argument2 != -1
		{
		sprite_index = argument2;
		}
	if argument3 != -1
		{
		image_index = argument3;
		}
	Aura_Light_Init(argument6, argument7, argument8, argument9);
	aura_light_enabled = argument10;    // Is the light enabled (true) or not (false)
	}
return _id;
}
else return noone;
