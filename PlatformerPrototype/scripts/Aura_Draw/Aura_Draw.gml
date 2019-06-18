/// @function		Aura_Draw();
/// @description	Draw the final AURA surface to the screen

// Set the belnd mode (we use a multiply blend mode to get better lighting
// that isn't as "burnt" or saturated as an additive blend mode).
gpu_set_blendmode_ext(bm_dest_color, bm_zero);

// Draw the main AURA surface... First we get the position to draw at based 
// on whether there is a view active or not.
if (aura_view > -1) {
	var _vx = camera_get_view_x(view_camera[aura_view]);
	var _vy = camera_get_view_y(view_camera[aura_view]);
} else {
	var _vx = 0;
	var _vy = 0;
}

// Here we check to see whether soft shadows are enabled
if (aura_soft > 0) {
	// Soft shadows are enabled so we need to set the shader properties before drawing
	var _vw = camera_get_view_width(view_camera[aura_view]);
	var _vh = camera_get_view_height(view_camera[aura_view]);
	shader_set(sh_Aura_Blur)
	shader_set_uniform_f(aura_soft_usize, _vw, _vh, aura_soft);
	// Draw the surface
	draw_surface(aura_surface, _vx, _vy);
	shader_reset()
} else {
	// No soft shadows so just draw the surface
	draw_surface(aura_surface, _vx, _vy);
}

// Reset the blend mode
gpu_set_blendmode(bm_normal);
