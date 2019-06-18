/// @description Draw pause menu

// Don't run the code below this line if the game is not paused
if (!pause) exit;

// Draw a gray box to darken the screen a bit
draw_set_alpha(0.7);
draw_rectangle_color(-10, -10, room_width + 10, room_height + 10, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

// Set starting locations to start drawing from
var _start_draw_x = room_width / 2 - (space_ * 2);
var _start_draw_y = room_height / 2 - space_;

// Draw the menu with a for loop -- m stands for "menu" (easier to read)
for (var m = 0; m < array_length_1d(menu_pause); m++) {
	// Normal drawing color of text
	var color = c_gray;
	
	// Change currently selected menu position color to red.
	if (m == menu_pos_)  color = c_white;
	
	// Draw menu
	draw_text_transformed_color(_start_draw_x + space_, _start_draw_y + (m * space_), string(menu_pause[m]), 1, 1, 0, color, color, color, color, 1);	
}

// Reset squash and stretch when the menu cursor moves
cursor_scale = approach(cursor_scale, 1, 0.1);

// Draw square where menu position is at -- some of these are 'magic numbers', used to make the sprite look good and uniform enough
var _select_width = sprite_get_width(s_select) / 2; // Get the width of sprite select to offset position slightly, so it displays in the middle
draw_sprite_ext(s_select, 0, _start_draw_x + 10, _start_draw_y + (menu_pos_ * space_) + _select_width - 2, cursor_scale, cursor_scale, cursor_rotate, c_white, 1);
