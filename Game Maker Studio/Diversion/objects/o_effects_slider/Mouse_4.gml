/// @description Click logic

// If this is enabled, allow the user to click and grab it
if (can_click_) {
	// Set the grabbed flag
	grabbed_ = true;
	
	// Get the relative position of the mouse click
	xx_ = x - mouse_x;
}
