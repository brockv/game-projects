/// @description Draw the menu

// Set starting locations of the top left corner of the menu to start drawing from
var _start_draw_x = 56;
var _start_draw_y = 64;

// Draw menu with a for loop --  m stands for "menu" (easier to read)
for (var m = 0; m < array_length_1d(menu_); m++) {
	var color = c_gray;	// Normal drawing color of text
	if (m == menu_pos_)  color = c_white; // Change currently selected menu position color to white
	
	// Draw menu
	draw_text_transformed_color(_start_draw_x + space_, _start_draw_y + (m * space_), string(menu_[m]), 1, 1, 0, color, color, color, color, 1);	
}

// Reset squash and stretch when menu cursor moves
cursor_scale_ = approach(cursor_scale_, 1, 0.1);

// Draw square where menu position is at -- some of these are 'magic numbers', used to make the sprite look good and uniform enough
var _select_width = sprite_get_width(s_select) / 2;	// Get the width of sprite select to offset position slightly so it displays in the middle
draw_sprite_ext(s_select, 0, _start_draw_x + 10, _start_draw_y + (menu_pos_ * space_) + _select_width - 2, cursor_scale_, cursor_scale_, cursor_rotate_, c_white, 1);
