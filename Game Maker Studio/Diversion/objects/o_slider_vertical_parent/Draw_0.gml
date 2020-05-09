/// @description Draw the slider bar

// Calculate the scale to apply to the sprites
if window_get_fullscreen() {
	// Calculate the scale based on the display width
    scale_ = 1 + floor(o_resolution.display_width_ / 500 * 0.1);
} else {
	// Calculate the scale based on the current width
    scale_ = 1 + floor(o_resolution.current_width_ / 500 * 0.1);
}

image_xscale = scale_ / 10 * 1;
image_yscale = scale_ / 10 * 1;

draw_sprite_ext(s_vertical_slider_bar, 0, xstart, ystart, image_xscale, image_yscale, image_angle, c_white, image_alpha);

draw_self();