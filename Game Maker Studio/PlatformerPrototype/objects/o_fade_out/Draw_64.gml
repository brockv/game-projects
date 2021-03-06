/// @description Draw fade

// Draw fade in effect
draw_set_alpha(fade_out_alpha_);
draw_rectangle_color(-10, -10, view_width + 10, view_height + 10, fade_out_color_, fade_out_color_, fade_out_color_, fade_out_color_, false);
draw_set_alpha(1);

// Set text alignment
draw_set_halign(fa_middle);

// Draw 'Level Complete' text
draw_text(room_width / 2, room_height / 2, "Level Complete");

// Reset text alignment
draw_set_halign(fa_left);