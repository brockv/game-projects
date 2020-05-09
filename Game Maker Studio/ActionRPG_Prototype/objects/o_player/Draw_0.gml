/// @description Draw Logic

// Draw the shadow
draw_sprite(s_medium_shadow, 0, x, y);

// Draw ourselves
draw_self();

// Draw ourselves with flashing when appropriate
draw_self_flash(c_white, 8, alarm[0]);

//// Draw the mask used for silhouettes
//gpu_set_blendenable(false);
//gpu_set_colorwriteenable(false, false, false, true);

//draw_set_alpha(0);

//// Get the position of the camera in the room
//var _x = x - sprite_xoffset;
//var _y = y - sprite_yoffset;

//// Draw the mask using the camera position
//draw_rectangle(_x, _y, _x + sprite_width, _y + sprite_height, false);
//draw_set_alpha(1);

//gpu_set_colorwriteenable(true, true, true, true);
//gpu_set_blendenable(true);