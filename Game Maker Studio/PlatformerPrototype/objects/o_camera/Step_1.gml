/// @description Activate the visible area

// Get the current dimensions of the camera
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);

// Activate the region inside the camera
instance_activate_region(_vx, _vy, _vw, _vh, true);