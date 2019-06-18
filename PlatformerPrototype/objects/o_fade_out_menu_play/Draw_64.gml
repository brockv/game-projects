/// @description Draw fade

// Draw fade in effect
draw_set_alpha(fade_in_alpha);
draw_rectangle_color(-10, -10, view_width + 10, view_heigth + 10, fade_in_color, fade_in_color, fade_in_color, fade_in_color, false);
draw_set_alpha(1);