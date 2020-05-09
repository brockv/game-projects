///@arg column
///@arg slot

var _column = argument[0];
var _slot = argument[1];

var _key = room_get_name(room) + "playerstate";
var _player_state = ds_grid_create(player_stats.column_count, 1);

_player_state[# _column, 0] = _slot;
show_debug_message(_player_state[# _column, 0]);

ds_map_replace(o_game.save_data_, _key, ds_grid_write(_player_state));

show_debug_message("Equipment slot updated...");

