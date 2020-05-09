///@description Step logic

event_inherited();
	
// Select button
if (alarm[2] <= 0) {
	if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 150, cy - 325, cx + 150, cy + 300)) {
		// Scroll through the buttons
		if (_key_down && button_ != button_count_ - 1) {
			// Update the selected button
			button_ = approach(button_, button_count_ - 1, 1);
	
			// Play a sound effect
			audio_play_sound(sound[0], 0, 0);
		
			// Menu control alarm
			alarm[2] = room_speed / 6;
		} else if (_key_up && button_ != 0) {
			// Update the selected button
			button_ = approach(button_, 0, 1);
	
			// Play a sound effect
			audio_play_sound(sound[0], 0, 0);
		
			// Menu control alarm
			alarm[2] = room_speed / 6;
		}
	}
	
	if (_key_confirm && point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 125, cy - 25, cx + 125, cy + 20)) {
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

////////////////////////////////////////////////////////////////////////////
//#endregion
