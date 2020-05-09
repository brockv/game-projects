///@description Draw logic

#region Draw Buttons & Background
//////////////////////////////////////////////////////////////////////////////

// Set the color and alpha back
draw_set_alpha(1);
draw_set_color(c_white);

// Set the alignment
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

// Set the font for the menu
draw_set_font(f_small);

// Draw buttons
for (var i = 0; i < button_count_; i++;) {
	draw_text_transformed_color(cx, button_y_[i] + 200,
								button_text_[i],
								button_scale_[i], button_scale_[i],	0,
								button_color_[i], button_color_[i], button_color_[i], button_color_[i],
								button_alpha_[i] * 1);
}

//draw_rectangle(cx - 125, cy + 50, cx + 125, cy + 105, true);
//draw_rectangle(cx - 150, cy - 50, cx + 150, cy + 165, true);

//////////////////////////////////////////////////////////////////////////////
#endregion