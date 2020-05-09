///@description Step logic

event_inherited();

#region Buttons		
////////////////////////////////////////////////////////////////////////////

// Button positions
for (var i = 0; i < button_count_; i++;) {
	var _x_set		= cx;
	var _y_set		= cy - (button_gap_* (button_ - i)); // Align the vertical offset of the buttons
	var _x_offset	= 0;
	var _y_offset	= 0;
	var _scale_set	= 1;
	var _alpha_set	= 1;
	var _color_set	= c_white;
	var _diff		= abs(button_ - i);

	// Currently hovered button
	if (button_ == i) { 
		//_x_set	= cx+ button_x_offset_[i]; 
		_scale_set	= 2.5;		// Scale
		_alpha_set	= 1;		// Alpha
		_color_set	= c_white;  // Color
		_x_offset	= 0;	    // Offset to the right
	// Other buttons
	} else {
		//_x_set	= cx;
		_scale_set	= 2 - (0.2 * _diff);
		_alpha_set	= 1 - (0.8 * _diff);
		_color_set	= c_gray;
		_x_offset	= 0;
	}
		
	// Set temp variables into the specified button array
	button_x_[i]	 = _x_set + button_x_offset_[i];
	button_y_[i]	 = lerp(button_y_[i], _y_set, 0.2);
	button_scale_[i] = lerp(button_scale_[i], _scale_set, 0.2);
	button_alpha_[i] = lerp(button_alpha_[i], _alpha_set, 0.2);
	button_color_[i] = _color_set;
		
	button_x_offset_[i]	= lerp(button_x_offset_[ i ], _x_offset, 0.2);
	button_y_offset_[i] = _y_offset;
}

////////////////////////////////////////////////////////////////////////////
#endregion

if (alarm[2] <= 0) {
	#region Up and Down
	////////////////////////////////////////////////////////////////////////////
	if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 150, cy - 50, cx + 150, cy + 165)) {
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
	////////////////////////////////////////////////////////////////////////////
	#endregion
}
#region Confirm
////////////////////////////////////////////////////////////////////////////
// Select button
if (_key_confirm && point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 125, cy + 50, cx + 125, cy + 105)) {
	// Play a sound effect
	audio_play_sound(sound[1], 0, 0);
	
	// Perform the appropriate action based on the selected button
	switch(button_) {
		// Light
		case 0: 
			global.background_color_ = light_
			global.background_color_button_ = 0;
			break;
		// Default
		case 1:
			global.background_color_ = default_;
			global.background_color_button_ = 1;				
			break;
		// Dark
		case 2:
			global.background_color_ = dark_;
			global.background_color_button_ = 2;
			break;
	}
		
	// Update the background color
	layer_background_blend(background_id_, global.background_color_);
		
	// Update the save file with the new background color information
	ini_save(o_resolution.file_name_);
} //end Confirm statement
	
////////////////////////////////////////////////////////////////////////////
#endregion
