///@description Loads any saved values there might be for the player

// Generate the same key we used when saving the player's state
var _key = room_get_name(ds_map_find_value(o_game.save_data_, "Saved Room")) + "playerstate";

// Attempt to pull the keys from the save file
var _string = o_game.save_data_[? _key];

// If the string exists, pull the appropriate information out of it
if (is_undefined(_string)) exit;
	
// Create the grids to pull values from
var _player_state = ds_grid_create(player_stats.column_count, 1);

// Read the values out of the strings into the grid
ds_grid_read(_player_state, _string);

// Recreate the player using those values
with (o_player)
{
	// Assign the appropriate values to the grid 
	room_				= _player_state[# player_stats.saved_room, 0];
	start_position_		= _player_state[# player_stats.start_position, 0];
	direction_facing	= _player_state[# player_stats.facing, 0];
	player_max_stamina_ = _player_state[# player_stats.max_stamina, 0];
	player_stamina_		= _player_state[# player_stats.stamina, 0];
	stamina_regen_time_ = _player_state[# player_stats.stamina_regen, 0];
	player_max_health_  = _player_state[# player_stats.max_health, 0];
	player_health_		= _player_state[# player_stats.current_health, 0];
	player_gems_		= _player_state[# player_stats.gem_count, 0];
	global.item[0]		= _player_state[# player_stats.equipment_slot_one, 0];
	global.item[1]		= _player_state[# player_stats.equipment_slot_two, 0];
	bombs				= _player_state[# player_stats.current_bombs, 0];
	max_bombs			= _player_state[# player_stats.max_bombs, 0];
	health_potions		= _player_state[# player_stats.health_potions, 0];
	max_health_potions	= _player_state[# player_stats.max_health_potions, 0];
	
}

// Destroy the grids now that we're done pulling values from them
ds_grid_destroy(_player_state);


