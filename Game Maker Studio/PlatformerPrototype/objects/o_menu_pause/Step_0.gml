/// @description Handle main menu navigation

// Don't run the code below this line if the game is not paused
if (!pause) exit;

// Initialize a variable to increase the current menu position with
var move_menu_pos = 0;

// Control menu position variables
if (alarm[0] <= 0) {
	move_menu_pos -= max(k_up, 0);
	move_menu_pos += max(k_down, 0);
	
	// If movement was detected, set the menu control alarm to limit movement speed
	if (move_menu_pos != 0) alarm[0] = one_second / 4;;
}

// Move menu position and loop menu
if (move_menu_pos != 0 ) { // If a menu button is pressed, move the game menu one position
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
	
	// Adjust cursor scale when position moves
	cursor_scale_ = 1.6;
	
	// Adjust the menu position based on movement variables
	menu_pos_ += move_menu_pos;
	
	// Loop the menu if we go past either the lower or upper bounds of the array
	if (menu_pos_ < 0) menu_pos_ = array_length_1d(menu_pause) - 1; // Lower bound
	if (menu_pos_ > array_length_1d(menu_pause) -1) menu_pos_ = 0;  // Upper bound
}

// Create "Back" and "Enter" buttons, for menu navigation
var _button_enter, _button_back;
_button_enter = max(k_enter, 0); // "Enter"
_button_back  = max(k_back, 0);  // "Back"

// Perform the appropriate action based on the user's menu activity
switch (menu_pos_) {
	// Check if "Enter" button is released the unpause game
	case 0:
		if _button_enter {
			pause = !pause; // Unpause the game
		} break; 
	
	// Check if "Enter" button is released then go to level select
	case 1:
		if _button_enter {
			// Create quit menu
			if !instance_exists(o_menu_level_select) instance_create_layer(x, y, "menu", o_menu_level_select);
			// Destroy self
			instance_destroy();
		} break; 
		
	// Check if "Enter" button is released then open options menu
	case 2:
		if _button_enter {
			// Create options menu
			if !instance_exists(o_menu_options) instance_create_layer(x, y, "menu", o_menu_options);
			// Destroy self
			instance_destroy();
		} break; 
		
	// Check if "Enter" button is released then create quit selection menu
	case 3:
		if _button_enter {
			// Create quit menu
			if !instance_exists(o_menu_quit) instance_create_layer(x, y, "menu", o_menu_quit);
			// Destroy self
			instance_destroy();
		} break; 
		
	default : break;
}

// Rotate cursor
cursor_rotate_ -= 2;

// Reset cursor rotate
if (cursor_rotate_ <= -360) cursor_rotate_ = 0;