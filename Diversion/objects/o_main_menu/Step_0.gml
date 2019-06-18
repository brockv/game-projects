///@description Step logic

event_inherited();


if (alarm[2] <= 0) {
	if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 150, cy - 50, cx + 150, cy + 250)) {
		// Scroll through the buttons
		if (_key_down && button_ != button_count_ - 1) {
			// Update the selected button
			button_ = approach(button_, button_count_ - 1, 1);

			// Play a sound effect
			audio_play_sound(sound[0], 0, 0);
	
			// Reset the idle alarm
			menu_idle_ = false;
			alarm[0] = room_speed * 10;
		
			// Menu control alarm
			alarm[2] = room_speed / 6;
		} else if (_key_up && button_ != 0) {
			// Update the selected button
			button_ = approach(button_, 0, 1);
	
			// Play a sound effect
			audio_play_sound(sound[0], 0, 0);
	
			// Reset the idle alarm
			menu_idle_ = false;
			alarm[0] = room_speed * 10;
		
			// Menu control alarm
			alarm[2] = room_speed / 6;
		}
	}
	
	// Select button
	if (_key_confirm && point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 135, cy + 75, cx + 135, cy + 120)) {
		// Play a sound effect
		audio_play_sound(sound[1], 0, 0);
	
		// Perform the appropriate action based on the selected button
		switch(button_) {
			// Go to options menu
			case 0: room_goto(r_options) break;
			// Go to instructions menu
			case 1: room_goto(r_instructions); break;
			// Go to level select
			case 2: room_goto(r_level_select) break;
			// Go to credits menu
			case 3: room_goto(r_credits); break;
			// Exit the game
			case 4: game_end();	break;
		}
	} //end Confirm statement
}

