/// @description resolution_configure()

// This script is automatically called whenever a change is made to the resolution settings

// Set the display properties accordingly, whether the game is full screen or windowed
if window_get_fullscreen() {
	// Calculate the scale based on the display width
    scale = 1 + floor(display_width_ / 500);
	
	// Set the camera to the display size divded by the scale
	camera_set_view_size(0, display_width_ / scale, display_height_ / scale);
	
	// Resize the surface to match the new window size
    surface_resize(application_surface, display_width_, display_height_);
} else {
	// Calculate the scale based on the current width
    scale = 1 + floor(current_width_ / 500);
	
	// Set the camera to the current window size divided by the scale
	camera_set_view_size(0, current_width_ / scale, current_height_ / scale);
	
	// Resize the window, GUI, and application surface to match the new width and height
    window_set_size(current_width_, current_height_);
	display_set_gui_size(current_width_, current_height_);
    surface_resize(application_surface, current_width_, current_height_);
	
	// Update the positioning for the menus
	if (instance_exists(o_menu_parent)) {
		with (o_menu_parent) {
			// Position variables
			gui_width_	= display_get_gui_width();
			gui_height_	= display_get_gui_height();
			cx			= gui_width_ / 2;
			cy			= gui_height_ / 2;
		}
	}
	
	// Center the window
    alarm[0] = 1;
}
