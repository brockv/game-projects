/// @description Player sprite logic



// Draw player sprite with array lookup table -- no flashing
draw_sprite_ext(sprite_array[sprite_state], image_index, x, y, facing * scale_x, scale_y, 0, c_white, 1);

// Draw tiles on specified increasingly transparent the farther they are from the light source
shader_set(set_tile_alpha);
shader_params = shader_get_uniform(set_tile_alpha, "playerPosition");
shader_set_uniform_f(shader_params, x, y - 10, radius);
layer_shader(grass_layer_id, set_tile_alpha);
layer_shader(grass_objects_layer_id, set_tile_alpha);
layer_shader(enemy_layer_id, set_tile_alpha);
layer_shader(platform_layer_id, set_tile_alpha);
layer_shader(spike_layer_id, set_tile_alpha);
layer_shader(ice_layer_id, set_tile_alpha);
shader_reset();

#region // Player flashing
// If flash is greater than 0, we need to draw the player with the flash shader
if (flash > 0) {
	// Decrement flash -- this amount felt smoothest, but can be changed
	flash -= 0.05;
	
	// Set the shader and the alpha variable (flash)
	shader_set(flash_sprite);
	shader_set_uniform_f(flashShaderAlpha, flash);

	// Draw player sprite with array lookup table -- with flashing
	draw_sprite_ext(sprite_array[sprite_state], image_index, x, y, facing * scale_x, scale_y, 0, c_white, 1);
	
	// Draw the sprite collision mask -- DEBUG
	//draw_sprite(mask_index, 0, x, y);

	// Reset the shader
	shader_reset();
}
#endregion