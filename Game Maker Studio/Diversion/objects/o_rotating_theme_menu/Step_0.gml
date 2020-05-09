///@description Menu control logic

// Inherit from o_rotating_menu_parent
event_inherited();

// Update the new middle
new_middle_ = display_get_gui_width() / 2;

// Control the menu
if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), new_middle_ - 100, o_options.theme_instructions_y_offset_ + 25, new_middle_ + 100, o_options.theme_instructions_y_offset_ + 75)) {
	// Control left movement of the menu
	if (_key_left || (mouse_check_button_pressed(mb_left) && device_mouse_x_to_gui(0) < new_middle_ - 50)) {
		if (rotating_ = 0) {
			rotating_ = rotation_amount_;
			if (button_ > 0) {
				button_ -= 1;
			} else {
				button_ = button_count_ - 1;
			}
		}
	}

	// Control right movement of the menu
	if (_key_right || (mouse_check_button_pressed(mb_left) && device_mouse_x_to_gui(0) > new_middle_ + 50)) {
		if (rotating_ = 0) {
			rotating_ -= rotation_amount_;
			if (button_ < button_count_ - 1) {
				button_ += 1;
			} else {
				button_ = 0;
			}
		}
	}
}

// Select button
if (rotating_ = 0) {
	if (_key_confirm && point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), 
				new_middle_ - 50, o_options.theme_instructions_y_offset_ + 15, new_middle_ + 50, o_options.theme_instructions_y_offset_ + 45)) {
		// Play a sound effect
		audio_play_sound(sound[1], 0, 0);

		// Perform the appropriate action based on the selected button
		switch(button_) {
			// Light
			case 0: 
				global.background_color_ = light_
				//global.background_color_button_ = 0;
				break;
			// Default
			case 1:
				global.background_color_ = default_;
				//global.background_color_button_ = 1;				
				break;
			// Dark
			case 2:
				global.background_color_ = dark_;
				//global.background_color_button_ = button_;
				break;
		}
		
		// Update the background color
		layer_background_blend(background_id_, global.background_color_);
		global.background_color_button_ = button_;
		
		// Update the save file with the new background color information
		ini_save(o_resolution.file_name_);
	}
}