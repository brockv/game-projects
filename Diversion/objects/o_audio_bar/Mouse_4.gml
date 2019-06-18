/// @description Move the slider

// If the slider is enabled, allow the user to adjust the value
if (can_click_) {
	// Allow the user to click the bar to move the slider
	if ((mouse_x > left_limit_) && (mouse_x < right_limit_)) {
		slider_.x = mouse_x;
		slider_.clicked_ = true;
	}
}
