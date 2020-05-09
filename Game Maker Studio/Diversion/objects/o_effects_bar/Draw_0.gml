/// @description Draw logic

// Draw self
draw_self();

// Draw the current value to the right of the bar
draw_text((x / 2 + 25) + sprite_get_width(s_slider_bar), y, string(o_effects_slider.percentage_));
