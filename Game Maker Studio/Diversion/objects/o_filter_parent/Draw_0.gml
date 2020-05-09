/// @description Insert description here
// You can write your code in this editor

// Inherit from o_draggable_parent
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

// Draw the inactive border if not grabbed or active
if (!grabbed_ && !active_) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color_, 1);
	draw_sprite(s_inactive_outline, outline_frame_, x, y);
}

// Draw self
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color_, 1);

