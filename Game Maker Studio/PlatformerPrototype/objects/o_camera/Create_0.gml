/// @description Initialize variables

// Set the target to follow
target_ = o_player;

// Set the width and height
width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

// Set the scale
scale_ = view_wport[0] / width_;

// Screen shake control
screen_shake_ = false;

