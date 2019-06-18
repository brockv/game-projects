/// @description Draw The Fade

// Draw a black fade
gpu_set_blendmode(bm_normal);
draw_set_color(c_black);
draw_set_alpha(alpha_);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Set the draw back to normal
draw_set_color(c_white);
draw_set_alpha(1);
