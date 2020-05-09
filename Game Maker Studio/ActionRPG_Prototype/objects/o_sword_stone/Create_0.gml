/// @description Initialize Variables

// Inherit from the parent object
event_inherited();

// Generate a unique key for saving
key_ = save_data_get_key();

// Stop the image from cycling
image_speed = 0;

// Set the starting image index
image_index = 1;

// Load the correct state for this object
var _save_data = ds_map_find_value(o_game.save_data_, key_);

if (!is_undefined(_save_data) && _save_data == true)
{
	// Set the ineraction flag
	item_collected_ = true;
	
	// Flip the image index
	image_index = 0;
}
else
{
	// Set an interacted flag
	item_collected_ = false;
}

