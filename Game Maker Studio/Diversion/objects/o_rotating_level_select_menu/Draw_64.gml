///@description Draw the menu

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

// Set the font
draw_set_font(f_selected);

// Set the alignment
draw_set_valign(fa_center);
draw_set_halign(fa_center);

var _index = 0;
if (global.level_unlocked_ >= button_) _index = 1;

// Draw all of the menu buttons
for (var _i = 0; _i < button_count_; _i++;) {
	// Determine how much to fade
	var _fade;
	_fade =- sin(pi / 180 * (direction + (rotation_amount_ * _i) - 90));
	
	// Set the minimum fade value
	if (_fade < 0.2) _fade = 0.2;
	
	//Makes the text go in that circle pattern according to their directions.   
	draw_sprite_ext(s_level_select_menu, 0, 
					cx + cos(pi / 180 * (direction + (rotation_amount_ * _i) - 90)) * x_distance_, 
					cy - sin(pi / 180 * (direction + (rotation_amount_ * _i) - 90)) * y_distance_, 
					0.15 * _fade, 0.15 * _fade, 0, c_white, _fade);					
}

// Draw current menu item that is selected
draw_text(cx, cy + 125, button_text_[button_]);

// Draw the lock sprite over levels that aren't unlocked yet
if (global.level_unlocked_ < button_) {
	draw_sprite(s_lock, image_index, cx, cy + 125);
	//draw_sprite_ext(s_lock, image_index, cx, cy + 125, 1, 1, 0, c_white, 1);
}

// Draw current menu item that is selected
//draw_text(cx, cy + 250, button_text_[button_]);

// DEBUG
//draw_rectangle(cx - 50, cy - 40, cx + 50, cy + 40, true);