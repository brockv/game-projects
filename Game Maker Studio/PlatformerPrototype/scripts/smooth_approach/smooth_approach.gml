/// @description smooth_approach(current, target, speed[0-1])
/// @param current
/// @param target
/// @param speed[0-1]
/*
 * Example use (smooth camera movement):
 * view_xview = smooth_approach(view_xview, x-view_wview/2, 0.1);
 * view_yview = smooth_approach(view_yview, y-view_hview/2, 0.1);
 */
var diff = argument[1] - argument[0];
if (abs(diff) < 0.0005) {
   return argument[1];
} else {
   return argument[0] + sign(diff) * abs(diff) * argument[2];
}
