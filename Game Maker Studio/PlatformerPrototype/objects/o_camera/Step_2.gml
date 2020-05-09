/// @description Camera logic

// Exit if the target is not present
if (!instance_exists(target_)) { exit; }

camera_set_view_target(target_, view_camera[0]);


// Move to the target's position
x = lerp(x, target_.x, 0.1);
y = lerp(y, target_.y - 8, 0.1);

// Round the pixels for smoother movement
x = round_n(x, 1 / scale_);
y = round_n(y, 1 / scale_);

// Clamp the x and y values so the camera stays within the room's bounds
x = clamp(x, width_ / 2, room_width - (width_ / 2));
y = clamp(y, height_ / 2, room_height - (height_ / 2));

// Update the view to reflect the movement of the camera
camera_set_view_pos(view_camera[0], x - (width_ / 2), y - (height_ / 2));

// Screen shake
if (screen_shake_)
{
    camera_set_view_angle(view_camera[0], random_range(-3, 3));
}
else
{
    camera_set_view_angle(view_camera[0], 0);
}
