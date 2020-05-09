/// @description Move controls

// Initialize variable to control vertical movement
var move_menu_vertical = 0;

// Initialize variable to control horizontal movement
var move_menu_horizontal = 0;

// Control menu position variables
if (alarm[0] <= 0) {
	// Up and down menu movement
	move_menu_vertical -= max(k_up, 0);
	move_menu_vertical += max(k_down, 0);
	
	// Left and right menu movement
	move_menu_horizontal -= max(k_left, 0);
	move_menu_horizontal += max(k_right, 0);
	
	// If movement was detected, set the menu control alarm to limit movement speed
	if (move_menu_vertical != 0) alarm[0] = one_second / 4;
	if (move_menu_horizontal != 0) alarm[0] = one_second / 4;
}


// Move menu position up and down, and loop menu if necessary
if (move_menu_vertical != 0) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
	
	// Adjust cursor scale when menu position moves
	cursor_scale_ = 1.6;
	
	// Adjust the menu position based on movement variables
	menu_pos_ += move_menu_vertical;
	
	// Loop the menu if we go past either the lower or upper bounds of the array
	if (menu_pos_ < 0) menu_pos_ = array_length_1d(menu) - 1; // Lower bound
	if (menu_pos_ > array_length_1d(menu) -1) menu_pos_ = 0;  // Upper bound
}

// Create "Back" and "Enter" buttons for menu navigation
var _button_enter, _button_back;
_button_enter = max(k_enter, 0);
_button_back  = max(k_back, 0);

// Perform the appropriate action based on the user's menu activity
switch (menu_pos_) {
	// Scroll through world numbers
	case 0:
		// Only increase world number if the first level of the world has been completed/unlocked by the player by visiting that room
		if ((move_menu_horizontal != 0) && (two[0,2])) {
			// Play a sound effect
			audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
			
			// Scroll to the next world in the direction the user pressed
			world_number_ += move_menu_horizontal;
			
			// Loop the menu if we go past either the lower or upper bounds of the array
			if (world_number_ < 0) world_number_ = array_length_1d(world) -1; // Lower bound
			if (world_number_ > array_length_1d(world) -1) world_number_ = 0;  // Upper bound
			
			// Set the menu control alarm
			//alarm[0] = 10;
		}
	break; 
	
	// Scroll through level numbers
	case 1:
		switch (world_number_) { // Depending on what world is selected on certain level numbers will be able to be selected
			// World one
			case 0:
				if (move_menu_horizontal != 0) { // Check if we are scrolling
					// Scroll forwards
					if (move_menu_horizontal > 0) {						
						if ((level_number_one_ == array_height_2d(one) - 1) && (one[level_number_one_, 2]) && (one[0, 2])) {
							level_number_one_ = 0; // Loop level array
						// Check to see if the level has been completed first so that we can move to that level
						} else if (one[level_number_one_, 2]) && (one[level_number_one_ + 1, 2]) {
							// Play a sound effect
							audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
						
							// If level has been completed, move to that level
							level_number_one_ += move_menu_horizontal;
						}
					} 
					
					// Scroll backwards			
					if (move_menu_horizontal < 0) {						
						if ((level_number_one_ == 0) && (one[level_number_one_, 2]) && (one[array_height_2d(one) - 1, 2] == 0)) {
							level_number_one_ = level_number_one_;
						// Check if last level of array has been completed, and if it has we can scroll backwards from level one
						} else if ((level_number_one_ == 0) && (one[level_number_one_, 2]) && (one[array_height_2d(one) - 1, 2])) {
							level_number_one_ = array_height_2d(one) -1;
						} else if ((one[level_number_one_, 2]) && (one[level_number_one_ - 1, 2])) {
							// Play a sound effect
							audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
							
							// If level has been completed, move to that level
							level_number_one_ += move_menu_horizontal;
						}
					} 
				}
				
			// Go to the selected level, if it's been completed / visisted
			if (_button_enter == 1 && one[level_number_one_, 2])  {
				// Unpause game
				pause = 0;
				
				// Play a sound effect
				audio_play_sound_on(emitter_sound_effects, a_unpause, false, 7);
							
				// Go to the selected level
				room_goto(one[level_number_one_, 1]);
			}
			break;
			
			// World two
			case 1:
				// Check if we are scrolling
				if (move_menu_horizontal != 0) {
					// Scroll forwards
					if (move_menu_horizontal > 0) {
						// Loop level array
						if (level_number_two_ == array_height_2d(two) - 1) && (two[level_number_two_, 2]) && (two[0, 2]) {
							level_number_two_ = 0;
						// Check to see if level has been completed first so that we can move to it
						} else if (two[level_number_two_, 2]) && (two[level_number_two_ + 1, 2]) {
							// Play a sound effect
							audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
							
							// If level has been completed, move to that level.
							level_number_two_ += move_menu_horizontal;
						}
					} 
					// Scroll backwards
					if (move_menu_horizontal < 0) {
						// Check if last level of array has been completed, and if it has we can scroll backwards from level one.
						if (level_number_two_ == 0) && (two[level_number_two_, 2]) && (two[array_height_2d(two) - 1, 2] == 0) {
							level_number_two_ = level_number_two_;
						// Scroll backwards one level
						} else if (level_number_two_ == 0) && (two[level_number_two_, 2]) && (two[array_height_2d(two) - 1, 2]) {
							level_number_two_ = array_height_2d(two) - 1;
						} else if (two[level_number_two_, 2]) && (two[level_number_two_ - 1, 2]) {
							// Play a sound effect
							audio_play_sound_on(emitter_sound_effects, a_menu_move, false, 7);
							
							// If the level has been completed, move to that level
							level_number_two_ += move_menu_horizontal;
						}
					} 
				}
				
			// Go to level selected
			if (_button_enter == 1 && two[level_number_two_, 2])  {
				// Unpause the game
				pause = 0;
				
				// Play a sound effect
				audio_play_sound_on(emitter_sound_effects, a_unpause, false, 7);
				
				// Go to the selected level
				room_goto(two[level_number_two_, 1]);
			}
			break; 
		
		default: break;
	}
	break;
	default : break;
}

// If the "Back" button is pressed, destroy menu
if (_button_back) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
	
	// Create menu if in menu room, else destroy quit menu
	if (room != rm_menu) {
		// Deactivate self
		if (!instance_exists(o_menu_pause)) instance_create_layer(x, y, "menu", o_menu_pause) instance_destroy();
	} else {
		if (!instance_exists(o_menu_select)) instance_create_layer(x, y, "menu", o_menu_select) instance_destroy();
	}
}

// Rotate cursor
cursor_rotate_ -= 2;

// Reset cursor rotate
if (cursor_rotate_ <= -360) cursor_rotate_ = 0;