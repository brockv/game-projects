///@description Draw the menu

#region Draw Buttons & Background
//////////////////////////////////////////////////////////////////////////////

if (screen_alpha_ > 0) {
	// Draw the sprite, if it exists
	if (sprite_exists(paused_sprite_)) {		
		draw_sprite(paused_sprite_, 0, 0, 0);
	}

	// Set the color and alpha, then draw a dark rectangle over the screen
	draw_set_color(c_black);
	draw_set_alpha(screen_alpha_);
	draw_rectangle(0, 0, gui_width_, gui_height_, false);

	// Set the color and alpha back
	draw_set_alpha(1);
	draw_set_color(c_white);

	// Set the alignment
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	
	// Set the font for the level display
	draw_set_font(f_selected);
	
	// Draw the current level
	draw_text(cx, 100, "Level " + string(room - 6));

	// Set the font for the menu
	draw_set_font(f_main);

	// Draw all of the menu buttons
	for (var _i = 0; _i < button_count_; _i++;) {
		// Determine how much to fade
		var _fade;
		_fade =- sin(pi / 180 * (direction + (rotation_amount_ * _i) - 90));
	
		// Set the minimum fade value
		if (_fade < 0.2) _fade = 0.2;

		//Makes the text go in that circle pattern according to their directions.   
		draw_sprite_ext(s_pause_menu, _i, 
						cx + cos(pi / 180 * (direction + (rotation_amount_ * _i) - 90)) * x_distance_, 
						cy - sin(pi / 180 * (direction + (rotation_amount_ * _i) - 90)) * y_distance_, 
						0.15 * _fade, 0.15 * _fade, 0, c_white, _fade);
	}
}

if (paused_) {
	// Draw current menu item that is selected
	draw_text(cx, cy + 125, button_text_[button_]);
	
	// -- DEBUG -- //
	//draw_rectangle(cx - 100, cy - 40, cx + 100, cy + 40, true);
	//draw_rectangle(cx - 150, cy - 150, cx + 150, cy + 150, true);
}

//////////////////////////////////////////////////////////////////////////////
#endregion
