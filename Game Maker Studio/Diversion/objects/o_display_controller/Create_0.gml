/// @description Initialize variables

// Display properties
ideal_width_ = 0;
ideal_height_ = 257;
zoom_ = 1;
max_zoom_ = 1;
use_sub_pixels_ = false;

// Room sizes
global.room_width_ = 1280;
global.room_height_ = 960;

// Find the aspect ratio of the current monitor
aspect_ratio_ = display_get_width() / display_get_height();

// Calculate the width based on the aspect ratio
ideal_width_ = round(ideal_height_ * aspect_ratio_);

// Check for odd numbers in the ideal width
if (ideal_width_ & 1) {
	ideal_width_++;
}

// Check for odd numbers in the ideal height
if (ideal_height_ & 1) {
	ideal_height_++;
}

// Set the maximum zoom
max_zoom_ = floor(display_get_width() / ideal_width_);

// Create the camera to assign tothe views
globalvar main_camera_;
main_camera_ = camera_create_view(0, 0, global.room_width_, global.room_height_, 0, noone, 0, 0, 0, 0);
camera_set_view_size(main_camera_, global.room_width_, global.room_height_);

//Setup all the ViewPorts
for (var _i = 1; _i <= room_last; _i++) {
	if (room_exists(_i)) {
		// Enable the view and setup the ViewPort
		room_set_view_enabled(_i, true)
		room_set_viewport(_i, 0, true, 0, 0, ideal_width_, ideal_height_);
	
		// Set the camera for the room
		room_set_camera(_i, 0, main_camera_);
	}
}

// Resize the surface, GUI, and window
surface_resize(application_surface, ideal_width_, ideal_height_);
//display_set_gui_size(ideal_width_, ideal_height_);
window_set_size(ideal_width_, ideal_height_);


// Center the window
alarm[0] = 1;

// Move to the main menu
room_goto_next();