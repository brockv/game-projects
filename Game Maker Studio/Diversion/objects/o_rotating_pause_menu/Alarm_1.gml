/// @description Pause
	
// Create the pause sprite from  the surface
paused_sprite_ = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);

// Deactivate everything else
instance_deactivate_all(true);
//audio_pause_all();

// Activate persistant objects
instance_activate_object(o_game);
instance_activate_object(o_resolution);

// Set the alpha
screen_alpha_set_ = 0.8;
