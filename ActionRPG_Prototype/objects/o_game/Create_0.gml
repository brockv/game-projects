/// @description Initialize Variables

// Create an enum for saving and loading the player's stats
#region // Player Stats Enum 
enum player_stats {
	saved_room,
	start_position,
	facing,
	max_stamina,
	stamina,
	stamina_regen,
	max_health,
	current_health,
	gem_count,
	equipment_slot_one,
	equipment_slot_two,
	current_bombs,
	max_bombs,
	health_potions,
	max_health_potions,
	column_count
}
#endregion

// Define a one second interval using the game speed
global.one_second = game_get_speed(gamespeed_fps);

// Initialize an array to keep track of destroyed objects
global.destroyed = [];

// Set a new default font
var _font_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.abcdefghijklmnopqrstuvwxyz1234567890>,!':-+";
global.font = font_add_sprite_ext(s_font, _font_string, true, 1);
draw_set_font(global.font);

file_name_ = "SaveData.sav";
save_data_ = ds_map_create();

// If the file already exists, load it
if (file_exists(file_name_)) {
	ds_map_destroy(save_data_);
	save_data_ = ds_map_secure_load(file_name_);
	
	// Set the game started to true
	ds_map_replace(save_data_, "Game Started?", true);
} else {
	// Add the initial room and start position to the map for immediate use
	ds_map_replace(save_data_, "Saved Room", r_world);
	ds_map_replace(save_data_, "Start Position", i_game_start);
	
	// Set the game started flag to false
	ds_map_replace(save_data_, "Game Started?", false);
}



