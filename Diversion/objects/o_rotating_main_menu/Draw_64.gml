///@description Draw the menu

// Set the alpha, font, and draw color
draw_set_alpha(1);
draw_set_font(f_selected);
draw_set_colour(c_white);

// Set the alignment
draw_set_valign(fa_center);
draw_set_halign(fa_center);

// Draw all of the menu buttons
for (var _i = 0; _i < button_count_; _i++;) {
	// Determine how much to fade
	var _fade;
	_fade =- sin(pi / 180 * (direction + (rotation_amount_ * _i) - 90));
	
	// Set the minimum fade value
	if (_fade < 0.2) _fade = 0.2;

	//Makes the text go in that circle pattern according to their directions.   
	draw_sprite_ext(s_main_menu, _i, 
					cx + cos(pi / 180 * (direction + (rotation_amount_ * _i) - 90)) * x_distance_, 
					cy - sin(pi / 180 * (direction + (rotation_amount_ * _i) - 90)) * y_distance_, 
					0.15 * _fade, 0.15 * _fade, 0, c_white, _fade);
}

// Draw current menu item that is selected
draw_text(cx, cy + 150, button_text_[button_]);

// DEBUG
//draw_rectangle(cx - 100, cy - 40, cx + 100, cy + 40, true);