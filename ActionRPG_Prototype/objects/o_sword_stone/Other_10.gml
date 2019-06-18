/// @description Interaction Logic

// If the item has already been taken, exit
if (item_collected_) exit;

// Create the item to be collected
instance_create_layer(x, y, "Instances", o_sword_found);
	
// Flip the image index
image_index = 0;
	
// Flip the flag
item_collected_ = true;
ds_map_replace(o_game.save_data_, key_, true);

// Set the player's state
other.state_ = player.found_item;

