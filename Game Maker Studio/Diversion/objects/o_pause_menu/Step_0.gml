///@description Step logic

#region		Audio
////////////////////////////////////////////////////////////////////////////

// Once the volume for the title music has reached 0, stop it
if (audio_sound_get_gain(a_title_music) <= 0) {
	audio_stop_sound(a_title_music);
}

#endregion

#region		Set Variables
////////////////////////////////////////////////////////////////////////////

// Inherit from o_menu_parent
event_inherited();

// Ease the alpha into the desired amount
screen_alpha_ = approach(screen_alpha_, screen_alpha_set_, 0.1);

////////////////////////////////////////////////////////////////////////////
#endregion

#region		Controls
////////////////////////////////////////////////////////////////////////////

// Trigger the pause menu
if (_key_pause) {
	if (paused_) {
		// Resume the game
		alarm[0]	= 2;
		audio_play_sound(a_unpause, 10, false);
	} else {
		// Pause the game
		alarm[1]	= 2;
		audio_play_sound(a_pause, 10, false);
	}
	// Flip the pause flag
	paused_ = !paused_
}

////////////////////////////////////////////////////////////////////////////
#endregion

#region		Buttons		
////////////////////////////////////////////////////////////////////////////

var _lowered_volume = ((global.music_volume_ * 100) / 2) / 100;

if (paused_) {
	// Lower the volume when paused	
	audio_sound_gain(a_puzzle_music, _lowered_volume, 1000);
	if (alarm[2] <= 0) {
		if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 150, cy - 150, cx + 150, cy + 150)) {
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
	
		// Select button
		if (_key_confirm && point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 150, cy - 30, cx + 150, cy + 25)) {
			if (paused_) {
				// Play a sound effect
				audio_play_sound(sound[1], 0, 0);
				switch(button_) {
					// Resume the game
					case 0: 
						alarm[0] = 2; // Resume timer 
						screen_alpha_set_ = 0; 
						break;
					// Restart the current level
					case 1: 
						room_restart();
						break;
					// Return to the main menu
					case 2:
						// Fade the music in
						audio_sound_gain(a_puzzle_music, 0, 1000);
						audio_play_sound(a_title_music, 1000, true);
						audio_sound_set_track_position(a_title_music, 0);
						audio_sound_gain(a_title_music, 0, 0);
						audio_sound_gain(a_title_music, global.music_volume_, 2000);
						room_goto(r_init);
						break;
					//// Return to the level select screen
					//case 3:
					//	// Fade the music in
					//	audio_sound_gain(a_puzzle_music, 0, 1000);
					//	audio_play_sound(a_title_music, 1000, true);
					//	audio_sound_set_track_position(a_title_music, 0);
					//	audio_sound_gain(a_title_music, 0, 0);
					//	audio_sound_gain(a_title_music, global.music_volume_, 2000);					
					//	room_goto(r_level_select);
					//	break;
					// Exit the game
					case 3: 
						game_end();
						break;
				}
			}
		} //end Confirm statement
	}
} else {
	audio_sound_gain(a_puzzle_music, global.music_volume_, 1000);
}

////////////////////////////////////////////////////////////////////////////
#endregion
