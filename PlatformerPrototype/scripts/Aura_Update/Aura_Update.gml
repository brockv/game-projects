/// @function		Aura_Update();
/// @description	Update all lights and shadows

// This script is where all the lights and shadows are updated and then drawn
// to the main AURA surface ready to be drawn to the screen.

// First, update all lights before drawing them...

Aura_Light_Update(aura_v_format, aura_s_buffer);

// Set drawing to the main surface if it exists, and if it doesn't recreate
// or end the game on an error. The number if iterations for the surface 
// re-init script is set to 50, but this can be changed to a lower or higher
// amount. Generally if it doesn't recreate after the first couple of attempts
// it won't, so a lower number like 5 is usually fine.

if !surface_exists(aura_surface)
{
if !Aura_ReInit(50)
    {
    // surface doesn't exist so end the game... This can be changed as required.
    game_end();
    exit;
    }
}
else
{
surface_set_target(aura_surface);

// Clear the surface to black
draw_clear(c_black);

// Draw the ambient penumbra colour
if aura_view > -1
    {
	var _vw = camera_get_view_width(view_camera[aura_view]);
	var _vh = camera_get_view_height(view_camera[aura_view]);
    draw_sprite_ext(s_aura_pixel, 0, -10, -10, _vw + 20, _vh + 20, 0, aura_colour, aura_alpha);
    }
else
    {
    draw_sprite_ext(s_aura_pixel, 0, -10, -10, room_width + 20, room_height + 20, 0, aura_colour, aura_alpha);
    }

// Set the blend mode for the lights. We use an additive belnd mode
// here to get the best luminosity, but the main AURA surface will be 
// drawn using a multiply blend mode for better realism.
gpu_set_blendmode(bm_add);

// Draw the fast lights (these do not cast shadows)
Aura_Light_Draw_Fast();

// Draw the lights (these do cast shadows)
Aura_Light_Draw();

// Reset blend mode
gpu_set_blendmode(bm_normal);

// Reset surface
surface_reset_target();
}
