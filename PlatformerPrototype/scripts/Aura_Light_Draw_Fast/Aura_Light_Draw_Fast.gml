/// @function		Aura_Light_Draw_Fast();
/// @description	Draw the fast lights to the main AURA surface.

// This script should not be called outside of the Aura_Update script.

// Draw the light sprite, using the colour and alpha settings
if (aura_view > -1) {
var _v = aura_view;
	with (o_aura_light_parent_fast) {
		var _vx = camera_get_view_x(view_camera[_v]);
		var _vy = camera_get_view_y(view_camera[_v]);
	    draw_sprite_ext(sprite_index, image_index, x - _vx, y - _vy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
} else {
	with (o_aura_light_parent_fast) {
	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
}
