/// @description Draw Logic

// Draw the shadow
draw_sprite(s_medium_shadow, 0, x, y);

// Draw ourselves
draw_self();

// Draw ourselves with flashing when appropriate
draw_self_flash(c_white, 8, alarm[0]);
