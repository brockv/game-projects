///@description Draw logic

#region Draw Buttons & Background
//////////////////////////////////////////////////////////////////////////////

// Set the color and alpha back
draw_set_alpha(1);
draw_set_color(c_white);

// Set the alignment
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

// Draw Buttons
for (var i=0; i < button_count_; i++;) {
	if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), cx - 100, cy * 2 - 50, cx + 100, cy * 2 - 25)) {
		button_color_[i] = c_white;
		draw_set_font(f_selected);
		draw_text_color(cx, gui_height_ - 35, button_text_[i], button_color_[i], button_color_[i], button_color_[i], button_color_[i], 1);
		draw_set_font(f_main);
	} else {
		button_color_[i] = c_gray;
		draw_set_font(f_main);
		draw_text_color(cx, gui_height_ - 35, button_text_[i], button_color_[i], button_color_[i], button_color_[i], button_color_[i], 1);
	}
	//draw_text_color(cx, y, button_text_[i], button_color_[i], button_color_[i], button_color_[i], button_color_[i], 1);
	//draw_text_transformed_color(cx, y, button_text_[i], button_scale_[i],
	//		button_scale_[i], 0, button_color_[i], button_color_[i], button_color_[i], button_color_[i], button_alpha_[i] * 1);
}

//draw_rectangle(cx - 100, gui_height_ - 50, cx + 100, gui_height_ - 25, true);

//////////////////////////////////////////////////////////////////////////////
#endregion
