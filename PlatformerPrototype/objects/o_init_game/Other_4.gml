/// @description Initialize the shaders for hidden layers

hidden_tile_alpha   = 1.0;
if (layer_exists(layer_get_id("hidden_tiles"))) {
	layer_fake[0]		= layer_get_id("hidden_tiles");
	map_fake[0]			= layer_tilemap_get_id(layer_fake[0]);
	u_hidden_tile_alpha = shader_get_uniform(set_tile_transparency, "alpha");
	
	layer_script_begin(layer_fake[0], hidden_tiles_alpha_set);
	layer_script_end(layer_fake[0], hidden_tiles_alpha_reset)
}
