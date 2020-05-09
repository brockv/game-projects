/// @description Step logic

if (room == r_main_menu) exit;

// If the volume for the puzzle music has reached 0, stop it
if (audio_sound_get_gain(a_puzzle_music) <= 0) {
		audio_stop_sound(a_puzzle_music);
}

// -- Level completion logic -- //

// Make sure there are switches present before proceeding
if (instance_exists(o_switch_parent)) {
	// Get the total number of switches in the level
	switch_count_ = instance_number(o_switch_parent);
	
	// Initialize an accumulator
	active_count_ = 0;
	
	// Loop through each switch in the level and check if it's active
	if (!level_complete_) {
		with (o_switch_parent) {
			// If a given switch is active, increment the accumulator
			if (active_) other.active_count_++;
		
			// If the number of active switches matches the number of switches in the level, it's complete
			if (other.active_count_ == other.switch_count_) {				
				other.level_complete_ = true;
				
				// Update the current level
				global.current_level_++;
				
				// Update the level unlocked variable
				if (global.level_unlocked_ <= global.current_level_) {
					global.level_unlocked_ = global.current_level_;					
				}
				
				// Save the game
				ini_save(o_resolution.file_name_);
				
				// Set the alarm for the fade transition object
				other.alarm[0] = 10;
				break;
			}
		}
	}
}