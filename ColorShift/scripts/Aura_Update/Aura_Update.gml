/// @description  Aura_Update();

// This script is where all the lights and shadows are updated and then drawn
// to the main surface ready to be drawn to the screen.

// First, update all lights before drawing them

Aura_Light_Update(aura_v_format, aura_s_buffer);

// Set drawing to the main surface if it exists, and if it doesn't recreate
// or end the game on an error.

if !surface_exists(aura_surface)
{
if !Aura_ReInit(aura_alpha, aura_colour)
    {
    // surface doesn't exist so end the game...
    game_end();
    exit;
    }
}
else
{
surface_set_target(aura_surface);

// Clear the surface to black
draw_clear(c_black);

// Draw the ambient colour
if view_enabled
    {
    draw_sprite_ext(spr_Aura_Pixel, 0, 0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0, aura_colour, aura_alpha);
    }
else
    {
    draw_sprite_ext(spr_Aura_Pixel, 0, 0, 0, room_width, room_height, 0, aura_colour, aura_alpha);
    }

// Set the blend mode for the lights
draw_set_blend_mode(bm_add);

// Draw the fast lights
//Aura_Light_Draw_Fast();

// Draw the lights
Aura_Light_Draw();

// Reset blend mode
draw_set_blend_mode(bm_normal);

// Reset surface
surface_reset_target();
}
