/// @description Run game objects and global checks

// Used to save the last level the player has visited
// Check for last level visited and set last_level variable to current room
if (room != rm_menu && last_level != room) { // Check if the current room is not the main menu, and check if the last level visited is not equal to the current room
	last_level = room;	
}


// Handle sound effects in menus
if ((room == rm_menu) || (pause)) { // Check if the game is paused or in main menu
	// Menu sounds
	if (k_enter || k_back || k_left || k_right || k_up || k_down) {
		// Play sound
		//audio_play_sound_on(emitter_sound_effects,a_menu,false,7);	
	}
}