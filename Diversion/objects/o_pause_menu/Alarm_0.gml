/// @description Resume
		
// Destroy the paused screen sprite if it exists to prevent memory leaks
if (sprite_exists(paused_sprite_)) {
	sprite_delete(paused_sprite_);
}

// Reactivate everything
instance_activate_all();
//audio_resume_all();

// Set the alpha
screen_alpha_set_ = 0;

// Reset button starting pos
button_			  = 0;

// Reset the paused flag
paused_ = false;