/// @description Position and image

gui_width_ = display_get_gui_width();
gui_top_ = display_get_gui_height() - display_get_gui_height();

// Calculate the scale to apply to the sprites
if window_get_fullscreen() {
	// Calculate the scale based on the display width
    scale_ = 1 + floor(o_resolution.display_width_ / 500 * 0.1);
} else {
	// Calculate the scale based on the current width
    scale_ = 1 + floor(o_resolution.current_width_ / 500 * 0.1);
}

image_xscale = scale_ / 1.5 * 1;
image_yscale = scale_ / 2 * 1;

// Adjust image index depending if the game is fullscreen or not
if (window_get_fullscreen()) {
	// Disabled
	image_index = 2;
} else if (position_meeting(mouse_x,mouse_y,id)) {
	// Highlighted
	image_index = 1;
} else {
	// Idle
	image_index = 0;
}
