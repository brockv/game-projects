/// @description Mask Logic

// Draw the mask used for silhouettes
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);

draw_set_alpha(0);

// Get the position of the camera in the room
var _cam = view_camera[0];
var _cx = camera_get_view_x(_cam);
var _cy = camera_get_view_y(_cam);
var _w = camera_get_view_width(_cam);
var _h = camera_get_view_height(_cam);

// Draw the mask using the camera position
draw_rectangle(_cx, _cy, _cx + _w, _cy + _h, false);
draw_set_alpha(1);

gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);
