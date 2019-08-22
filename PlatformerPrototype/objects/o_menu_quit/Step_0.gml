/// @description Handle main menu navigation

// If a certain menu is active, disable other menus

// Initialize a variable to control horizontal menu movement
var move_menu_pos = 0;

// Control menu position variables
if (alarm[0] <= 0) {
	move_menu_pos -= max(k_left, 0);
	move_menu_pos += max(k_right, 0);
	
	// If movement was detected, set the menu control alarm to limit movement speed
	if (move_menu_pos != 0) alarm[0] = 10;
}

// Move menu position and loop menu
if (move_menu_pos != 0 ) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
	
	// Adjust cursor scale when position moves
	cursor_scale_ = 1.6;
	
	// Adjust the menu position based on movement variables
	menu_pos_ += move_menu_pos;
	
	// Loop the menu if we go past either the lower or upper bounds of the array
	if (menu_pos_ < 0) menu_pos_ = array_length_1d(menu_quit) - 1; // Lower bound
	if (menu_pos_ > array_length_1d(menu_quit) -1) menu_pos_ = 0;  // Upper bound
}

// Create "Back" and "Enter" buttons, for menu navigation
var _button_enter, _button_back;
_button_enter = max(k_enter, 0); // "Enter"
_button_back  = max(k_back, 0);  // "Back"

// Perform the appropriate action based on the user's menu activity
switch (menu_pos_) {
	// Check if "Enter" is released, then go back to menu
	case 0:
		// Reactivate main menu
		if (_button_enter) {
			// Play a sound effect
			audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
			// Create menu if in menu room else destroy quit menu
			if (room != rm_menu) {
				// Destroy self and create pause menu
				if (!instance_exists(o_menu_pause)) instance_create_layer(x, y, "menu", o_menu_pause);
				instance_destroy();
			} else {
				// Destroy self and create main menu
				if (!instance_exists(o_menu_select)) instance_create_layer(x, y, "menu", o_menu_select);
				instance_destroy();
			}
		} break; 
	// Check if "Enter" is released, then quit game
	case 1:
		if (_button_enter) {
			// Play a sound effect
			audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
			
			// If we're not already in the main menu, go there
			if (room != rm_menu) {
				room_goto(rm_menu);
				
				// Unpause game
				pause = !pause;
			// End game if quit from menu
			} else {
				game_end();
			}
		} break; 
		
	default : break;
}

// If "Back" is pressed, destroy menu
if (_button_back) {
		// Play a sound effect
		audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
		// Create menu if in menu room, else destroy quit menu
		if (room != rm_menu) {
			// Deactivate self
			if (!instance_exists(o_menu_pause)) instance_create_layer(x, y, "menu", o_menu_pause);
			instance_destroy();
		} else {
			if (!instance_exists(o_menu_select)) instance_create_layer(x, y, "menu", o_menu_select);
			instance_destroy();
		}
}


// Rotate cursor
cursor_rotate_ -= 2;

// Reset cursor rotate
if (cursor_rotate_ <= -360) cursor_rotate_ = 0;