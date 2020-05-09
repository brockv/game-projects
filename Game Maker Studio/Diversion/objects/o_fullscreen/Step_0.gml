/// @description Position logic

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
image_yscale = scale_ / 1.5 * 1;

// Set the image index based on whether the game is full screen or not
image_index = window_get_fullscreen()*2;

// Change the image when moused over
if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)) image_index++;
