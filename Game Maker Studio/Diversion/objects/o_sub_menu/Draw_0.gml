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
	if (point_in_rectangle(mouse_x, mouse_y, cx - 150, y - 25, cx + 150, y + 20)) {
		button_color_[i] = c_white;
		draw_set_font(f_selected);
		draw_text_color(cx, y, button_text_[i], button_color_[i], button_color_[i], button_color_[i], button_color_[i], 1);
		draw_set_font(f_main);
	} else {
		button_color_[i] = c_gray;
		draw_set_font(f_main);
		draw_text_color(cx, y, button_text_[i], button_color_[i], button_color_[i], button_color_[i], button_color_[i], 1);
	}
	//draw_text_color(cx, y, button_text_[i], button_color_[i], button_color_[i], button_color_[i], button_color_[i], 1);
	//draw_text_transformed_color(cx, y, button_text_[i], button_scale_[i],
	//		button_scale_[i], 0, button_color_[i], button_color_[i], button_color_[i], button_color_[i], button_alpha_[i] * 1);
}

//draw_rectangle(cx - 100, y - 25, cx + 100, y + 20, true);

//////////////////////////////////////////////////////////////////////////////
#endregion
