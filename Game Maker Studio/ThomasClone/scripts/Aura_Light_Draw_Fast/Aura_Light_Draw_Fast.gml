/// @description  Aura_Light_Draw_Fast();

// Here we draw the fast light to the main surface. This script should
// not be called outside of the Aura_Update script.

// Draw the light sprite, using the colour and alpha settings

if view_enabled
{
with (obj_Aura_Light_Parent_Fast)
    {
    draw_sprite_ext(sprite_index, image_index, x - __view_get( e__VW.XView, 0 ), y - __view_get( e__VW.YView, 0 ), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
else
{
with (obj_Aura_Light_Parent_Fast)
    {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
