/// @function								Aura_Init(ambient_alpha, ambient_colour, aa_enable, view, tilemap)
/// @description							Create the main AURA light surface
/// @param {real}			ambient_alpha	The base alpha value (0 - 1) for the penumbra that the light will illuminate
/// @param {real}			ambient_colour	The colour for the penumbra ambience
/// @param {bool}			aa_enable		Whether the shadows should be smooth or not
/// @param {real}			view			The view to use, or -1 for no views
/// @param {real/string}	tilemap			*OPTIONAL* The tilemap to use for shadow casting (tilemap ID or -1)
/// @param {real}			soft			*OPTIONAL* Set "soft" shadow level (use 0 for none, or an integer value to enable - the higher the value the greater the softness)

show_debug_message("Main surface initialised");

// Note that this engine ONLY PERMITS ONE ACTIVE VIEW! You specify the view to use
// when you call the function or set it to -1 if no views are required. Also note that 
// if you are not using views and your room size is large (or even with a large view 
// size) you may have memory issues on devices. As a rule of thumb, try not to make any 
// surface larger than 2048x2048.

// DO NOT USE THIS SCRIPT EXCEPT ONCE TO INIITIALISE AURA. Note too that there is a 
// ReInit script resource which will be used to re-initialise the surface if it is lost 
// from memory for whatever reason.

// Set the darkness alpha value (0 - 1)
aura_alpha = argument[0];

// Set the ambient colour for the darkness 
aura_colour = argument[1];

// Start defining a custom vertex format. This is sligthly faster than using the 
// general built in primitive vertex formats.
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();

// Save the vertex format to a variable and create a vertex buffer for the shadow meshes
aura_v_format = vertex_format_end();
aura_s_buffer = vertex_create_buffer();

// Now set the anti-alaiasing level. With anti-aliasing enabled, the shadows created 
// will have smoother, aliased edges. Without this then they will be pixelated (ideal 
// for retro games). Note that if you disable anti-aliasing then you should also disable
// soft shadows otherwise you won't get the pixelated effect.
aura_aa = 0;
if argument[2]
{
if display_aa >= 12
    {
    display_reset(8, false);
	aura_aa = 8;
    }
else
    {
    if display_aa >= 6
        {
        display_reset(4, false);
		aura_aa = 4;
        }
    else
        {
        if display_aa >= 2
            {
            display_reset(2, false);
			aura_aa = 2;
            }
        else
            {
            display_reset(0, false);
            }
        }
    }
}
else
{
display_reset(0, false);
}

// Set the view port to use (-1 for no views, or 0 - 7)
aura_view = argument[3];

// If a layer tilemap is going to be used for a shadow caster, we need to initialise this.
// This is an OPTIONAL argument, and can be either ignored, set to -1 (no tilemap) or 
// be set to a layer ID value (string or real, depending on how the layer was created).
aura_tiles = -1;
if argument_count > 4
{
aura_tiles = argument[4];
// See if the supplied layer actually exists in the room
if !layer_exists(aura_tiles) aura_tiles = -1;
// If a tilemap layer ID is supplied as a string, we need to convert it to a real.
// Note that the code handles cases where the tilemap argument is not supplied, 
// or the tilemap layer given does not exist in the current room, so you can either
// omit this argument, or supply one even if the layer doesn't exist in all rooms 
// and the engine will adapt.
// IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// Even though you are specifying a tile layer for shadows, this layer will still
// need to be initialised using the script "Aura_Shadow_Caster_Tile_Init". See the
// Create Event of the DEMO controller object to see how and the script resource 
// for more information.
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if is_string(aura_tiles)
	{
	aura_tiles = layer_get_id(aura_tiles);
	}
}

// Setup the tile map DS list. This list will hold a series of DS maps with the 
// vertex coordinates for each of the tile layer shadow casters.
aura_tile_list = -1;
if aura_tiles > -1
{
aura_tile_list = ds_list_create();
}

// Set up tilemap initial shadow length
aura_tile_length = 100000;

// Check for soft shadows. Soft shadows uses a shader to add "blur" to the final AURA 
// surface. It's fast and simple to use, so shouldn't affect performance too much when
// enabled. This is another OPTIONAL argument and can be omitted when callin the Init
// script, or it can be set to 0 to disable or greater than 0 for different levels 
// of smoothing (2 looks good for the demo, but it will depend on many factors, like
// room/viewport size, so experiment!).
aura_soft = 0;
aura_soft_usize = -1;
if argument_count > 5
{
if shader_is_compiled(sh_Aura_Blur)
	{
	aura_soft = argument[5];
	aura_soft_usize = shader_get_uniform(sh_Aura_Blur,"size");
	}
}

// Check to see if we are using views or not and initialise the main AURA surface
if aura_view > -1
{
// View is active so create a surface that size
var _vw = camera_get_view_width(view_camera[aura_view]);
var _vh = camera_get_view_height(view_camera[aura_view]);
aura_surface = surface_create(_vw, _vh);
}
else
{
// No views, so create a surface for the room
aura_surface = surface_create(room_width, room_height);
}
