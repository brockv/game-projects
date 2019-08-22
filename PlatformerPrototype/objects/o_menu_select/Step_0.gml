/// @description Menu navigation logic

// If certain menu active, disable other menus

// Initialize variable to control menu position with
var move_menu_pos = 0;

// Control menu position variable
if (alarm[0] <= 0) {
	move_menu_pos -= max(k_up, 0);
	move_menu_pos += max(k_down, 0);
	
	// If movement was detected, set the menu control alarm to limit movement speed
	if (move_menu_pos != 0) alarm[0] = 10;
}

// Move menu position and loop menu if necessary
if (move_menu_pos != 0) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
	
	// Adjust cursor scale when position moves
	cursor_scale_ = 1.6;
	
	// Adjust the menu position based on movement variables
	menu_pos_ += move_menu_pos;
	
	// Loop the menu if we go past either the lower or upper bounds of the array
	if (menu_pos_ < 0) menu_pos_ = array_length_1d(menu_) - 1; // Lower bound
	if (menu_pos_ > array_length_1d(menu_) -1) menu_pos_ = 0;  // Upper bound
}

// Create "Back" and "Enter" buttons, for menu navigation
var _button_enter, _button_back;
_button_enter = max(k_enter, 0);
_button_back  = max(k_back, 0);

// Perform the appropriate action based on the player's menu activity
switch (menu_pos_) {
	// Start game
	case 0:
		if _button_enter {
			// Play a sound effect
			audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
			room_goto(rm_test);
			//if (!instance_exists(o_fade_out_menu_play)) instance_create_layer(0, 0, "menu", o_fade_out_menu_play);
		} break; 
		
	// Level select
	case 1:
		if _button_enter {
			// Play a sound effect
			audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
			// Create quit menu
			if (!instance_exists(o_menu_level_select)) instance_create_layer(x, y, "menu", o_menu_level_select);
			// Destroy self
			instance_destroy();
		} break; 
		
	// Options menu
	case 2:
		if _button_enter {
			// Play a sound effect
			audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
			// Create options menu
			if (!instance_exists(o_menu_options)) instance_create_layer(x, y, "menu", o_menu_options);
			// Destroy self
			instance_destroy();
		} break;
		
	// Quit game
	case 3:
		if _button_enter {
			// Play a sound effect
			audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
			// Create quit menu
			if (!instance_exists(o_menu_quit)) instance_create_layer(x, y, "menu", o_menu_quit);
			// Destroy self
			instance_destroy();
		} break; 
		
	default: break;
}

// Rotate cursor
cursor_rotate_ -= 2;

// Reset cursor rotate
if (cursor_rotate_ <= -360) cursor_rotate_ = 0;