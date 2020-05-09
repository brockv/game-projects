/// @description Load Game Logic

// If the file doesn't exist, don't try and load it
if (!file_exists(o_game.file_name_)) exit;

// Play a sound effect and then stop all audio
audio_play_sound(a_menu_select, 0, false);
audio_stop_all();

// Destroy the current save data, then load the saved values
ds_map_destroy(o_game.save_data_);
o_game.save_data_ = ds_map_secure_load(o_game.file_name_);

// Get the saved room and go to it
var _saved_room = ds_map_find_value(o_game.save_data_, "Saved Room");
var _current_room = ds_map_find_value(o_game.save_data_, "Current Room");

//show_debug_message("Saved Room... " + room_get_name(_saved_room));
//show_debug_message("Current Room... " + _current_room);
room_goto(_saved_room);

// Start the default background game music
audio_play_sound(a_background_music, 10, true);

//show_debug_message("Saved game loaded...");
