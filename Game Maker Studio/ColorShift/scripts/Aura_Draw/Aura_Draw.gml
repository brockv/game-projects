/// @description  Aura_Draw();

// Set the belnd mode (multiply)
draw_set_blend_mode_ext(bm_dest_color, bm_zero);

// Draw the aura surface
if view_enabled
{
draw_surface(aura_surface, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ));
}
else
{
draw_surface(aura_surface, 0, 0);
}

// Reset the blend mode
draw_set_blend_mode(bm_normal);
