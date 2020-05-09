/// @description Destroy logic

// Add it to the list of destroyed objects
if (!is_in_destroyed_list(id)) {
	add_to_destroyed_list(id);
}