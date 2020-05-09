/// @description New Game Logic

// Play a sound effect and then stop all audio
audio_play_sound(a_menu_select, 0, false);
audio_stop_all();

// If a save file exists, delete it and make a new one
if (file_exists(o_game.file_name_))
{
	// Delete the old file and map
	file_delete(o_game.file_name_);
	ds_map_destroy(o_game.save_data_);
	
	// Create new ones
	o_game.file_name_ = "SaveData.sav";
	o_game.save_data_ = ds_map_create();
	
	// Add the initial room and start position to the map for immediate use
	ds_map_replace(o_game.save_data_, "Saved Room", r_world);
	ds_map_replace(o_game.save_data_, "Start Position", i_game_start);
	
	// Set the game started flag to true
	ds_map_replace(o_game.save_data_, "Game Started?", true);
}

// Start the default background game music
audio_play_sound(a_background_music, 10, true);

room_goto(starting_room_);
