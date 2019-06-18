/// @description Handle pause event

// Check if we are not in the main menu
if (room != rm_menu) {
	// If pause key pressed, toggle paused variable, and check if quit menu exists so that when we press the back key we dont accidentally unpause the game
	if (k_pause) && (!instance_exists(o_menu_parent) ){
		pause = !pause;	// or pause = 1 - pause;
	}
}

// Create pause menu if the game is paused
if (k_pause && pause ) {
	if (!instance_exists(o_menu_pause)) instance_create_layer(x, y, "menu", o_menu_pause);	
}