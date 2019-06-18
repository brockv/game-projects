/// @description Draw Logic

// Draw the shadow
draw_sprite(s_small_shadow, 0, x, y);

//draw_rectangle(x + (4 * sign(image_xscale)), y - 8, x + (12 * sign(image_xscale)), y - 16, true);

// Draw ourselves
draw_self();

// Draw ourselves with flashing when appropriate
draw_self_flash(c_white, 8, alarm[0]);