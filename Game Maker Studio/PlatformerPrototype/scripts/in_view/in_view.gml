/// @function				in_view(view);
/// @description			Check if an instance is in view, or if views aren't enabled.
/// @param {real}	view	The view to check (-1 for no views)

// Check view is enabled
if argument0 != -1
{
// Setup light bounding box vars
var a_left = x - aura_light_radius;
var a_top = y - aura_light_radius;
var a_right = x + aura_light_radius;
var a_bottom = y + aura_light_radius;
// Get view vars
var _vx = camera_get_view_x(view_camera[argument0]);
var _vy = camera_get_view_y(view_camera[argument0]);
var _vw = camera_get_view_width(view_camera[argument0]);
var _vh = camera_get_view_height(view_camera[argument0]);
// Check
if a_right < _vx || 
   a_bottom < _vy || 
   a_left > (_vx + _vw) || 
   a_top > (_vy + _vh)
		{
		return false;
		}
	else return true;
}
else return true;
