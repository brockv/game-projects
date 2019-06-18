///@description Draw logic

// Inherit from o_draggable_parent (draws the outline when grabbed)
event_inherited();

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

// Draw the base and center node, and then the splitter
draw_sprite_ext(s_splitter_base_large_, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
//draw_sprite_ext(s_splitter_base_large, 2, x, y, image_xscale, image_yscale, image_angle, color_, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, color_, image_alpha);

// The object isn't currently grabbed OR active, draw the inactive outline
if (!grabbed_ && !active_) {
	draw_sprite(s_inactive_outline, outline_frame_, x, y);
}
