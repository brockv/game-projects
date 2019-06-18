///@description Menu control logic

// Inherit from o_rotating_menu_parent
event_inherited();

// Control left movement of the menu
if (_key_left || (mouse_check_button_pressed(mb_left) && device_mouse_x_to_gui(0) < cx - 32)) {
	if (rotating_ = 0) {
		rotating_ = rotation_amount_;
		if (button_ > 0) {
			button_ -= 1;
		} else {
			button_ = button_count_ - 1;
		}
		
		// Play a sound effect
		audio_play_sound(sound[0], 0, 0);
	}
}

// Control right movement of the menu
if (_key_right || (mouse_check_button_pressed(mb_left) && device_mouse_x_to_gui(0) > cx + 32)) {
	if (rotating_ = 0) {
		rotating_ -= rotation_amount_;
		if (button_ < button_count_ - 1) {
			button_ += 1;
		} else {
			button_ = 0;
		}
		// Play a sound effect
		audio_play_sound(sound[0], 0, 0);
	}
}

// Select button
if (rotating_ = 0) {
	if (_key_confirm && point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 100, cy - 40, cx + 100, cy + 40)) {
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