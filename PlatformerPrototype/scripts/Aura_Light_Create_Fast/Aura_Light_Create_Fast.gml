/// @function					Aura_Light_Create_Fast(layer, instance, sprite, index, x, y, xscale, yscale, angle, colour, alpha);
/// @description				Initialise the instance variables for the fast light
/// @param {real}	layer		The layer (real or string) to create the light instance on
/// @param {real}	instance	The instance to create (must be a child of "o_aura_light_parent"
/// @param {real}	sprite		The sprite for the light to use (set to -1 for default instance sprite)
/// @param {real}	index		The image index of the sprite to use (set to -1 to use the index set by the instance)
/// @param {real}	x			The x position to create the light at
/// @param {real}	y			The y position to create the light at
/// @param {real}	xscale		The x-axis scale to use
/// @param {real}	yscale		The y-axis scale to use
/// @param {real}	angle		The angle for the sprite
/// @param {real}	colour		The colour to tint the light with
/// @param {real}	alpha		The alpha (0-1) for the light to use

// This is a convenience function for creating a fast light instance on a layer. It is 
// designed so that you simply need a parent or generic fast light instance and use this 
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
	Aura_Light_Init_Fast(argument6, argument7, argument8, argument9, argument10);
	}
return _id;
}
else return noone;
