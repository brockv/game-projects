/// @description Handle options menu navigation.
var move_menu_pos = 0;	// create variable to increase the current menu position with.
var move_horizontally = 0;	// Create var to move left and right in menu.
// max is used to choose the max value 
// between given numbers. if no keyboard input detected, 
// it will choose the max between 0,0. if keboard input detected it will choose between 1,0. 
// So the max value will be 1.
if (alarm[0] <= 0) {
	move_menu_pos -= max(k_up,0);	// -1 from current menu position when keyboard released.
	move_menu_pos += max(k_down,0);	// +1 from current menu position when keyboard released.
	move_horizontally -= max(k_left,0);
	move_horizontally += max(k_right,0);
	
	// If movement was detected, set the menu control alarm to limit movement speed
	if (move_menu_pos != 0) alarm[0] = 10;
	if (move_horizontally != 0) alarm[0] = 10;
}
// Move menu position and loop menu.
if (move_menu_pos != 0 ) { // if keyboard button pressed move the game menu one position.
	cursor_scale = 1.6;	// resize cursor scale when position moves.
	menu_pos_ += move_menu_pos;	// Move menu position.
	// loop menu array, if menu pos goes beyond 3 or lower than 0, menu pos will start from the top.
	 if (menu_pos_ < 0) menu_pos_ = array_length_1d(menu_option) - 1; // lower than 0, loop to the highest menu pos
	 if (menu_pos_ > array_length_1d(menu_option) -1) menu_pos_ = 0;  // bigger than highest menu pos, reset back to 0;
}

// Create "Back" and "Enter" buttons, for menu navigation
var _button_enter, _button_back;
_button_enter = max(k_enter, 0); // "Enter"
_button_back  = max(k_back, 0);  // "Back"

// Perform the appropriate action based on the user's menu activity
switch (menu_pos_) {
    // Toggle screenshake on or off
	case 0:
		// Check corresponding button/key is pressed left or right, and toggle screenshake on or off
		if (move_horizontally != 0) { // Left or right button/key is pressed
			// Toggle screenshake on or off
			screenshake_on += move_horizontally;
			
			// Loop screenshake between 0 and 1
			if (screenshake_on < 0) screenshake_on = array_length_1d(screenshake_on_off) - 1;
			if (screenshake_on > array_length_1d(screenshake_on_off) - 1) screenshake_on = 0;  
		}
        break;
	
	// Music volume
	case 1:
		if (move_horizontally != 0) { // Left or right button/key is pressed
			sound_music_gain += move_horizontally*0.1; // Move music volume ten percent at a time
			sound_music_gain = clamp(sound_music_gain,0,1); // Clamp music volume
		}
	    break;
		
	// Sound FX volume
	case 2:
		if (move_horizontally != 0){ // Left or right button/key is pressed
			sound_effects_gain += move_horizontally*0.1; // Move FX volume ten percent at a time
			sound_effects_gain = clamp(sound_effects_gain,0,1); // Clamp music volume
		}
	    break;
    default: break;
}

// If "Back" is pressed, destroy menu
if (_button_back) {
		// Play a sound effect
		audio_play_sound_on(emitter_sound_effects, a_menu_select, false, 7);
		
		// Create menu if in the main menu room, else destroy quit menu
		if (room != rm_menu) {
			// Deactivate self
			if !instance_exists(o_menu_pause) instance_create_layer(x, y, "menu", o_menu_pause);
			instance_destroy();
		} else {
			if !instance_exists(o_menu_select) instance_create_layer(x, y, "menu", o_menu_select);
			instance_destroy();
		}
}
