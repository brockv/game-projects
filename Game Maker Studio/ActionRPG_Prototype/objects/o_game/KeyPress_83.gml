/// @description Save Debug

// Save the player's information (if they exist), and the game
if (instance_exists(o_player)) {
	// Save the player's state
	save_player_stats();

	// Update and save the game file
	ds_map_secure_save(save_data_, file_name_);
	
	// Display debug message
	show_debug_message("Game saved...");
} else {
	show_debug_message("Unable to save game...");
}


