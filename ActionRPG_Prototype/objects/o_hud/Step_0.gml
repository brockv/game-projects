/// @description Step Logic

// Allow the player to navigate the inventory if the game is paused
if (paused_)
{
	// Get the current size of the inventory
	var _array_size = array_length_1d(global.inventory);
	
	if (alarm[0] <= 0) {	
		// Allow navigation through the inventory
		if (o_input.right_pressed_) // Right
		{
			// Move to the right
			item_index_ = min(item_index_ + 1, _array_size - 1);
		
			// Play a sound effect
			audio_play_sound(a_menu_move, 1, false);
		
			// Add a delay
			alarm[0] = room_speed / 6;
		}
	
		if (o_input.left_pressed_) // Left
		{
			// Move to the left
			item_index_ = max(item_index_ - 1, 0);
		
			// Play a sound effect
			audio_play_sound(a_menu_move, 1, false);
		
			// Add a delay
			alarm[0] = room_speed / 6;
		}
	}
	// Allow the player to set items to their equipment slots
	if (o_input.action_one_pressed_) // Slot 1
	{
		// If this item was already equipped in the other slot, remove it
		if (global.item[1] == global.inventory[item_index_]) global.item[1] = noone;
		
		// Equip the item
		global.item[0] = global.inventory[item_index_];
		audio_play_sound(a_menu_select, 3, false);
		
		// Update what was saved to this equipment slot
		//ds_map_replace(o_game.save_data_, "Equipment Slot 1", global.item[0]);
		//ds_map_secure_save(o_game.save_data_, o_game.file_name_);
	}
	
	if (o_input.action_two_pressed_) // Slot 2
	{
		// If this item was already equipped in the other slot, remove it
		if (global.item[0] == global.inventory[item_index_]) global.item[0] = noone;
		
		// Equip the item
		global.item[1] = global.inventory[item_index_];
		audio_play_sound(a_menu_select, 3, false);
		
		// Update what was saved to this equipment slot
		//ds_map_replace(o_game.save_data_, "Equipment Slot 2", global.item[1]);
		//ds_map_secure_save(o_game.save_data_, o_game.file_name_);
	}
}

// Pause and unpause the game
if (o_input.pause_pressed_)
{
	if (paused_)
	{
		// Toggle the pause function and activate all instances
		paused_ = false;
		instance_activate_all();
		
		// Delete the paused sprite image
		if (sprite_exists(paused_sprite_))
		{
			sprite_delete(paused_sprite_);
		}
		
		// Play a sound effect
		audio_play_sound(a_unpause, 5, false);
	}
	else
	{
		// Toggle the pause function and deactivate all instances
		paused_ = true;
		instance_deactivate_all(true);
		
		// Reactivate the inventory objects
		var _array_size = array_length_1d(global.inventory);
		for (var _i = 0; _i < _array_size; _i++)
		{
			instance_activate_object(global.inventory[_i]);
		}
		
		// Reactivate the input object
		instance_activate_object(o_input);
		
		// Reactivate the game object
		instance_activate_object(o_game);
		
		// Create the paused sprite image
		paused_sprite_ = sprite_create_from_surface(application_surface, 0, 0, view_wport[0], view_hport[0], false, false, 0, 0);
		
		// Play a sound effect
		audio_play_sound(a_pause, 5, false);
	}
}
