/// @description Move camera

// Check if the target exists, and center the camera on the player
// if target not set, dont run rest of code.
if instance_exists(o_player) {
	camera_target_ = o_player;
	// Move the camera object toward the target
	x = lerp(x, camera_target_.x, 0.1);
	y = lerp(y, camera_target_.y-sprite_height/2, 0.1); // Minus sprite height to center on player sprite
} else {
	camera_target_ = noone;	
}

// Sub-pixel movement
x = round_n(x, 1/camera_scale_);
y = round_n(y, 1/camera_scale_);

// Clamp view
x = clamp(x, camera_width_ / 2, room_width - camera_width_ / 2);
y = clamp(y, camera_height_ / 2, room_height - camera_height_ / 2);

camera_set_view_pos(view_camera[0], x - camera_width_/2 + screenshake_amount_x, y - camera_height_/2 + screenshake_amount_y);

