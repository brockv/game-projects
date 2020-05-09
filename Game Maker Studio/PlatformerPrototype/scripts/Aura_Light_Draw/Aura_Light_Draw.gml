/// @function		Aura_Light_Draw();
/// @description	Draw the light to the main AURA surface.

//  This script should not be called outside of the Aura_Update script.

// Draw the individual light surface, using the colour and alpha settings
if (aura_view > -1) {
	var _v = aura_view;
	with (o_aura_light_parent) {    
		if (aura_light_enabled) {
			var _vx = camera_get_view_x(view_camera[_v]);
			var _vy = camera_get_view_y(view_camera[_v]);
			draw_surface_ext(aura_light_surface, x - aura_light_radius - _vx, y - aura_light_radius - _vy, 1, 1, 0, aura_light_colour, aura_light_alpha);
		}
	}
} else {
	with (o_aura_light_parent) {	   
		if (aura_light_enabled) {
			draw_surface_ext(aura_light_surface, x - aura_light_radius, y - aura_light_radius,  1, 1, 0, aura_light_colour, aura_light_alpha);
		}		
	}
}
