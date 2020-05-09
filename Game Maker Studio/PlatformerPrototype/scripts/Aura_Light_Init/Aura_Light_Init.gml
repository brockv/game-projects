/// @function				Aura_Light_Init(radius_, colour, alpha, static, [scale]);
/// @description			Create a new light source
/// @param {real}	radius_	The radius_ of the light being created
/// @param {real}	colour	The colour of the light blending
/// @param {real}	alpha	The alpha of the light
/// @param {bool}	static	Whether the light is static (set to true) or dynamic (false)
/// @param {bool}	scale	OPTIONAL! Whether to scale the light sprite or not

// Initialising the light creates a unique surface for it, and also a 
// number of variables for the instance which can then be modified at 
// any time to change things. Note that if the light is STATIC you can 
// still modify the light colour and alpha with - NO PERFORMANCE LOSS - a
// good way to get some simple effects like alarm lights without the hit 
// to performance associated with dynamic lights. Note that if your sprite 
// is larger or smaller than the radius_ of the light being created, you can 
// set the optional scale argument to true and the sprite will be scaled 
// to fit the radius_ (this ONLY WORKS WITH SPRITES THAT HAVE THE ORIGIN 
// CENTERED!)

// Set the light variables
aura_light_radius = argument[0];      // Light radius_
aura_light_colour = argument[1];      // Light colour
aura_light_alpha = argument[2];       // Light alpha
aura_light_static = argument[3];      // Set the light to static (true) or dynamic (false)
aura_light_update = true;             // Should the light update (true) or not(false)
aura_light_enabled = true;            // Is the light enabled (true) or not (false)

// Compensate for greater/smaller radius_ of the light than the sprite
if (argument_count > 4) {
	if (argument[4]) {
		image_xscale = (aura_light_radius * 2) / sprite_get_width(sprite_index);
		image_yscale = (aura_light_radius * 2) / sprite_get_height(sprite_index);
	}
}

// A static light will generate a shadow mesh once when created, but
// Not update again afterwards, meaning that the shadows it generates 
// will not change if it is moved. You CAN force a static light to update
// for one step by setting "aura_light_update" to "true". The shadows cast
// will update and then light will become static again the next. In the 
// Demo room this is used in the "door" objects to only update their
// shadows when the door moves.

// Notes:
//     1) Use the "enabled" variable to switch a light on and off
//     2) If a light is flagged as static, you can force it to update by setting 
//        the "update" variable to true. The update is for one frame only.
//     3) If you change a static light to dynamic, you will also need to set the 
//        the update variable to true otherwise it won't change.
//     4) A dynamic light can be made static at any time by simply setting the 
//        "static" variable to true. It takes one frame to become static.

// The light is drawn to a surface along with the shadow meshes, so create the surface

aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);
if surface_exists(aura_light_surface)
{
surface_set_target(aura_light_surface);
draw_clear_alpha(c_black, 1);
surface_reset_target();
}

