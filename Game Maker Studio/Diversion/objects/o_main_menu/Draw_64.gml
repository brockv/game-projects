///@description Draw logic

#region Draw Buttons & Background
//////////////////////////////////////////////////////////////////////////////

// Set the color and alpha
draw_set_alpha(1);
draw_set_color(c_white);

// Set the alignment
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

// Set the font for the menu
draw_set_font(f_small);

// Draw Buttons
for (var i = 0; i < button_count_; i++;) {
	//draw_text_color(button_x_[i], button_y_[i], button_text_[i], button_color_[i], button_color_[i], button_color_[i], button_color_[i], 1);
	if (!menu_idle_) {
	//draw_text_transformed_color(cx, button_y_[i] + 100, button_text_[i], button_scale_[i],
	//		button_scale_[i], 0, button_color_[i], button_color_[i], button_color_[i], button_color_[i], button_alpha_[i] * 1);
	draw_text_transformed_color(x + cos(pi / 180 * (direction + (rot_ammount * i) - 90)) * item_xdistance,
								y - sin(pi / 180 * (direction + (rot_ammount * i) - 90)) * item_ydistance,
								button_text_[i],
								button_text_[i], button_text_[i], 0,
								c_white, c_white, c_white, c_white, fade);
	} else {
		//draw_text_transformed_color(cx, button_y_[i] + 100, button_text_[i], button_scale_[i],
		//	button_scale_[i], 0, col_one_, col_one_, col_two_, col_two_, button_alpha_[i] * 1);
		draw_text_transformed_color(x + cos(pi / 180 * (direction + (rot_ammount * i) - 90)) * item_xdistance,
								y - sin(pi / 180 * (direction + (rot_ammount * i) - 90)) * item_ydistance,
								button_text_[i],
								button_text_[i], button_text_[i], 0,
								col_one_, col_one_, col_two_, col_two_, button_alpha_[i] * 1);
	}
}

draw_rectangle(cx - 135, cy + 75, cx + 135, cy + 120, true);
draw_rectangle(cx - 150, cy - 50, cx + 150, cy + 250, true);

//////////////////////////////////////////////////////////////////////////////
#endregion