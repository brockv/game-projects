///@description Menu control logic

// Inherit from o_rotating_menu_parent
event_inherited();


// Control left movement of the menu
if (_key_left || (mouse_check_button_pressed(mb_left) && device_mouse_x_to_gui(0) < cx - 50)) {
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
if (_key_right || (mouse_check_button_pressed(mb_left) && device_mouse_x_to_gui(0) > cx + 50)) {
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
	if (_key_confirm && point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 50, cy - 40, cx + 50, cy + 40)) {
		if (global.level_unlocked_ >= button_) {
			// Play a sound effect
			audio_play_sound(sound[1], 0, 0);
		
			// Stop the title music and fade in the puzzle music -- (if it's not already playing)
			if (!audio_is_playing(a_puzzle_music)) {
				audio_sound_gain(a_title_music, 0, 2000);
				audio_play_sound(a_puzzle_music, 1000, true);
				audio_sound_gain(a_puzzle_music, 0, 0);
				audio_sound_gain(a_puzzle_music, 0.5, 3000);
			}
			
			// Update the current level variable
			global.current_level_ = button_ + 1;
		
			// Go to the appropriate room
			room_goto(asset_get_index("r_level_" + string(button_ + 1)));
		}

	} //end Confirm statement
}