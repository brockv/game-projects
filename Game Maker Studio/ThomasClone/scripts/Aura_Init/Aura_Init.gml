/// @description  Aura_Init(ambient_alpha, ambient_colour, aa_enable)
/// @param ambient_alpha
/// @param  ambient_colour
/// @param  aa_enable

show_debug_message("Main surface re-initialised");

// Create the surface, checking for a view.
// Note that this engine ONLY PERMITS ONE ACTIVE VIEW! Also note that if you are 
// not using views and your room size is large (or even with a large view size) 
// you may have memory issues on devices. As a rule of thumb, try not to make any 
// surface larger than 2048x2048.

// Note too that there is a ReInit sub-script in another tab for this one which 
// will be used to re-initialise the surface if it is lost from memory.

if view_enabled
{
// View is active so create a surface that size
aura_surface = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
}
else
{
// No views, so create a surface for the room
aura_surface = surface_create(room_width, room_height);
}

// Set the brightness (alpha)
aura_alpha = argument0;

// Set the ambient colour
aura_colour = argument1;

// Create a custom vertex format. This is sligthly faster than using the general 
// built in primitive vertex formats.
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();

// Save the format to a variable and create a vertex buffer for the shadow meshes
aura_v_format = vertex_format_end();
aura_s_buffer = vertex_create_buffer();

// Now set the anti-alaiasing level. With this enabled, the shadows created 
// will be smoother and have aliased edges. Without this then they will be 
// pixelated (ideal for retro games).
if argument2
{
if display_aa >= 12
    {
    display_reset(8, false);
    }
else
    {
    if display_aa >= 6
        {
        display_reset(4, false);
        }
    else
        {
        if display_aa >= 2
            {
            display_reset(2, false);
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

