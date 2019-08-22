/// @description Player sprite logic -- OBSOLETE

//// Draw player sprite with array lookup table -- no flashing
//draw_sprite_ext(sprite_array[sprite_state], image_index, x, y, facing * scale_x, scale_y, 0, c_white, 1);
//draw_text(x - string_width(effect_shine_timer_) / 2, y + 20, effect_shine_timer_);
//draw_text(x, y + 40, radius_);

//// Draw tiles on specified increasingly transparent the farther they are from the light source
//shader_set(set_tile_alpha);
//shader_params = shader_get_uniform(set_tile_alpha, "playerPosition");
//shader_set_uniform_f(shader_params, x, y, radius_);
//layer_shader(tile_layer_id_, set_tile_alpha);
//layer_shader(hidden_tile_layer_id_, set_tile_alpha);
//layer_shader(background_tiles_layer_id_, set_tile_alpha);
//layer_shader(grass_objects_layer_id_, set_tile_alpha);
//layer_shader(enemy_layer_id_, set_tile_alpha);
//layer_shader(platform_layer_id_, set_tile_alpha);
//layer_shader(spike_layer_id_, set_tile_alpha);
//layer_shader(ice_layer_id_, set_tile_alpha);
//shader_reset();
