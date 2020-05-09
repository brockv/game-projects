/// @description Room Start Logic

// Set the current room in the map
ds_map_replace(save_data_, "Current Room", room_get_name(room));

// Determine where to place the player
var _start = ds_map_find_value(save_data_, "Start Position");
if (!is_undefined(_start) && instance_exists(_start)) {
	// Check if the player exists already - Don't want duplicates
	if (!instance_exists(o_player))	{
		// Respawn the player
		instance_create_layer(_start.x, _start.y, "Instances", o_player);
	} else {
		o_player.persistent = false;
		o_player.x = _start.x;
		o_player.y = _start.y;
		o_player.layer = layer_get_id("Instances");
	}
}
