///@description Saves the current state of the player

// Create a grid to hold the player's state
var _player_state = ds_grid_create(player_stats.column_count, 1);

with (o_player)
{
	// Assign the appropriate values to the grid 
	_player_state[# player_stats.saved_room, 0]			= room_;
	_player_state[# player_stats.start_position, 0]		= start_position_;
	_player_state[# player_stats.facing, 0]				= direction_facing_;
	_player_state[# player_stats.max_stamina, 0]		= player_max_stamina_;
	_player_state[# player_stats.stamina, 0]			= player_stamina_;
	_player_state[# player_stats.stamina_regen, 0]		= stamina_regen_time_;
	_player_state[# player_stats.max_health, 0]			= player_max_health_;
	_player_state[# player_stats.current_health, 0]		= player_health_;
	_player_state[# player_stats.gem_count, 0]			= player_gems_;
	_player_state[# player_stats.equipment_slot_one, 0] = global.item[0];
	_player_state[# player_stats.equipment_slot_two, 0] = global.item[1];
	_player_state[# player_stats.current_bombs, 0]		= o_bomb_item.amount_;
	_player_state[# player_stats.max_bombs, 0]			= max_bombs;
	_player_state[# player_stats.health_potions, 0]		= health_potions;
	_player_state[# player_stats.max_health_potions, 0]	= max_health_potions;
	
}

// Generate a unique key for the player's state and consumables in order to write it to the file
var _key = room_get_name(o_player.room_) + "playerstate";

// Write the grid to the save file
ds_map_replace(save_data_, _key, ds_grid_write(_player_state));

// Update the current room and start position in the file
ds_map_replace(save_data_, "Saved Room", o_player.room_);
ds_map_replace(save_data_, "Start Position", o_player.start_position_);


// Destroy the grid now that the data has been written to the file
ds_grid_destroy(_player_state);