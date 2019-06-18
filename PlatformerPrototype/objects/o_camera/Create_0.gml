/// @description Initialize the camera

// Start position
x = 0;	// Starting x location
y = 0;	// Starting y location

// Give the camera a target to follow
camera_target_ = noone;

// Get the width and height of the camera
camera_width_ = camera_get_view_width(view_camera[0]);
camera_height_ = camera_get_view_height(view_camera[0]);

// Sub-pixel movement

// Scale variable
camera_scale_ = view_wport[0] / camera_width_;
