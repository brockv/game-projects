/// @description Pause
	
// Create the pause sprite from  the surface
paused_sprite_ = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);

// Deactivate everything
instance_deactivate_all(true);
//audio_pause_all();

// Activate persistant objects like Cameras & Controllers!
instance_activate_object(o_game);

// Set the alpha
screen_alpha_set_	= 0.8;

// Reset the button values
for (var i = 0; i < button_count_; i++;) {
	button_x_[i]		= 0;
	button_y_[i]		= 0;
	button_scale_[i]	= 1;
	button_color_[i]	= c_white;
	button_alpha_[i]	= 1;
	button_speed_[i]	= 0;
	button_x_offset_[i]	= 0;
	button_y_offset_[i]	= 0;
	button_y_speed_[i]	= 0;
}