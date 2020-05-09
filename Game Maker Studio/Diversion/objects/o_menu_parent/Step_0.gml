/// @description Step logic

#region		Set Variables
////////////////////////////////////////////////////////////////////////////

// Menu controls
_key_pause	 = keyboard_check_pressed(vk_escape);
_key_down	 = mouse_wheel_down();
_key_up		 = mouse_wheel_up();
_key_confirm = mouse_check_button_pressed(mb_left);


////////////////////////////////////////////////////////////////////////////
#endregion


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
		_alpha_set	= 1 - (0.2 * _diff);
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
