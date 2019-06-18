/// @description Load Debug

// If the file doesn't exist, don't try and load it
if (!file_exists(file_name_)) exit;

// Destroy the current save data, then load the saved values
ds_map_destroy(save_data_);
save_data_ = ds_map_secure_load(file_name_);

var _saved_room = ds_map_find_value(save_data_, "Saved Room");
var _current_room = ds_map_find_value(save_data_, "Current Room");
if (!is_undefined(_saved_room) && _current_room != _saved_room) {
	show_debug_message("Saved Room... " + room_get_name(_saved_room));
	show_debug_message("Current Room... " + _current_room);
	room_goto(_saved_room);
} else {
	room_restart();
	event_perform(ev_other, ev_room_start);
}

show_debug_message("Saved game loaded...");