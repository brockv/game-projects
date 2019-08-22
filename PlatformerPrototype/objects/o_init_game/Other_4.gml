/// @description Initialize the shaders for hidden layers

// If this isn't the main menu, check for the hidden layers
if (room != rm_menu) {
	// Make sure the layer exists before trying to index it
	if (layer_exists(layer_get_id("hidden_tiles"))) {
		layer_fake[0]		= layer_get_id("hidden_tiles");						  // Index the ID of the layer
		map_fake[0]			= layer_tilemap_get_id(layer_fake[0]);				  // Index the tilemap for the layer
		u_hidden_tile_alpha = shader_get_uniform(set_tile_transparency, "alpha"); // Get the shader variable for later
	
		// Apply the scripts responsible for the shader to the hidden layer
		layer_script_begin(layer_fake[0], hidden_tiles_alpha_set);
		layer_script_end(layer_fake[0], hidden_tiles_alpha_reset)
	}
	
	//Aura_Shadow_Caster_Tile_Init(32, 32, false);
}

if (instance_exists(o_player)) {
	if (o_player.start_position_ != noone) {
		o_player.x = o_player.start_position_.x;
		o_player.y = o_player.start_position_.y;
	} else {
		o_player.x = o_player_start_location.x;
		o_player.y = o_player_start_location.y;
	}
	o_player.persistent = false;
	o_player.layer = layer_get_id("player");
}