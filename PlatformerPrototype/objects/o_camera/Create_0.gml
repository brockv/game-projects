/// @description Initialize the camera

// Start position
x = o_player.x;	// Starting x location
y = o_player.y;	// Starting y location

// Give the camera a target to follow
camera_target_ = o_player;

// Get the width and height of the camera
camera_width_   = camera_get_view_width(view_camera[0]);
//default_width_  = camera_width_;
camera_height_  = camera_get_view_height(view_camera[0]);
//default_height_ = camera_height_;

// Sub-pixel movement
default_lerp_ = 0.1;
lerp_		  = default_lerp_;

// Scale variable
camera_scale_ = view_wport[0] / camera_width_;

zoom_ = 1;