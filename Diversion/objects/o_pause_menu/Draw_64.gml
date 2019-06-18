///@description Draw logic

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
	draw_set_font(f_large);
	
	// Draw the current level
	draw_text(cx, 100, "Level " + string(room - 6));

	// Set the font for the menu
	draw_set_font(f_small);
	
	// Draw Buttons
	for( var i=0; i<button_count_; i++; ){
		draw_text_transformed_color(cx, button_y_[i], button_text_[i], button_scale_[i], button_scale_[i], 0,
					button_color_[i], button_color_[i], button_color_[i], button_color_[i], button_alpha_[i] * screen_alpha_);
	}
}

//draw_rectangle(cx - 150, cy - 25, cx + 150, cy + 25, true);
//draw_rectangle(cx - 150, cy - 150, cx + 150, cy + 150, true);

//////////////////////////////////////////////////////////////////////////////
#endregion