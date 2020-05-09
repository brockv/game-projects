/// @description  Aura_Light_Draw();

// Here we finally draw the light to the main surface. This script should
// not be called outside of the Aura_Update script.

// Draw the light surface, using the colour and alpha settings

if view_enabled
{
with (obj_Aura_Light_Parent)
    {
    draw_surface_ext(aura_light_surface, x - aura_light_radius - __view_get( e__VW.XView, 0 ), y - aura_light_radius - __view_get( e__VW.YView, 0 ), 1, 1, 0, aura_light_colour, aura_light_alpha);
    }
}
else
{
with (obj_Aura_Light_Parent)
    {
    draw_surface_ext(aura_light_surface, x - aura_light_radius, y - aura_light_radius,  1, 1, 0, aura_light_colour, aura_light_alpha);
    }
}
