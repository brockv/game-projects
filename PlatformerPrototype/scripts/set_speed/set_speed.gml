/// @description set_speed(speed, direction)
/// @param speed
/// @param  direction
/*
 * works the same as GM's motion_set function
 * except we're using hsp and vsp instead of hsp_eed and vsp_eed
 */
speed = argument[0];
direction = argument[1];
hsp = hsp_eed;
vsp = vsp_eed;
hsp_eed = 0;
vsp_eed = 0;
hsp = max(-hsp__max, min(hsp__max, hsp));
vsp = max(-vsp__max, min(vsp__max, vsp));
