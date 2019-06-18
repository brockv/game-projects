///@description Draw logic

#region Draw Buttons & Background
//////////////////////////////////////////////////////////////////////////////

// Set the color and alpha back
draw_set_alpha(1);
draw_set_color(c_white);

// Set the alignment
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

// Draw the room title
draw_set_font(f_large);
draw_text(cx, 40, "Level Select");
draw_text(cx, 70, "--------------");

// Set the font for the menu
draw_set_font(f_small);

// Draw buttons
for (var i = 0; i < button_count_; i++;) {
	draw_text_transformed_color(cx, button_y_[i], button_text_[i], button_scale_[i],
			button_scale_[i], 0, button_color_[i], button_color_[i], button_color_[i], button_color_[i], button_alpha_[i] * 1);
	
	// Draw the lock sprite over levels that aren't unlocked yet
	if (global.level_unlocked_ < i + 1) {
		draw_sprite_ext(s_lock, image_index, cx, button_y_[i], clamp(button_scale_[i], 0, 1), clamp(button_scale_[i], 0, 1), 0, button_color_[i], button_alpha_[i] * 1);
	}
}

//draw_rectangle(cx - 125, cy - 25, cx + 125, cy + 20, true);
//draw_rectangle(cx - 150, cy - 325, cx + 150, cy + 300, true);

//////////////////////////////////////////////////////////////////////////////
#endregion