/// @description Step logic

// If the mouse is not clicking on this, set grabbed to false
if (!mouse_check_button(mb_left)) {
	// The slider is not being clicked on, therefore it's not grabbed
	grabbed_ = false;
}

// If this object is not being grabbed, exit
if ((!grabbed_) && (!clicked_)) {
	exit;
// Otherwise, change its coordinates
} else {
	// If we slide within the constraints, update the slider's coordinates
	if ((mouse_x + xx_) > left_limit_ && (mouse_x + xx_) < right_limit_) {
		x = mouse_x + xx_;
	} else if ((mouse_x + xx_) < left_limit_) {
		x = left_limit_
	} else if ((mouse_x + xx_) > right_limit_) {
		x = right_limit_;
	}
}

// Update the volume for the music audio group
percentage_ = round(((x - left_limit_) / (right_limit_ - left_limit_)) * 100);
global.effects_volume_ = percentage_ / 100;

// Adjust the sound effects
audio_sound_gain(a_menu_move, global.effects_volume_, 0);
audio_sound_gain(a_menu_select, global.effects_volume_, 0);
audio_sound_gain(a_pause, global.effects_volume_, 0);
audio_sound_gain(a_unpause, global.effects_volume_, 0);

// Save the game
ini_save(o_resolution.file_name_);

// Set clicked to false to prevent the slider from sticking to the mouse
clicked_ = false;