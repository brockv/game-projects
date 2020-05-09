/// @description Fade logic

// Increase alpha value
fade_out_alpha_ += 0.05;

// Reduce room transition timer when alpha reaches 1
if (fade_out_alpha_ >= 1) {
	room_transition_timer_ -= 1;	
}

// Keep 'Level Complete' text on screen for couple seconds before going to the next level
if (room_transition_timer_ <= 0) {
	// If the current room is not equal to the last room in the game, go to the next room
	if (room != room_last) {
		room_goto(next_room_); // Go to the next room
	// The current room is the last room in the game -- go back to main menu
	} else {
		room_goto(rm_menu); // Go to the main menu
	}
	
}
