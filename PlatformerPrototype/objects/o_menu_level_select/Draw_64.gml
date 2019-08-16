/// @description Draw menu

// Set starting locations of the top left corner of the menu to start drawing from
var _start_draw_x = vw_ / 2 - (space * 3);
var _start_draw_y = vh_ / 2 - space;
var _select_width = sprite_get_width(s_select) / 2; // Get radius of the sprite

// Draw gray box around screen ot darken screen a bit
draw_set_alpha(0.7);
draw_rectangle_color(-10, -10, vw_ + 10, vh_ + 10, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

// Draw green square in background
draw_sprite_ext(s_level_select_square, world_number_, vw_ / 2, vh_ / 2, 1, 1, 45, c_ltgray, 1);

// Draw box around currently selected level
var box_color = c_ltgray;
if (menu_pos_ == 1) box_color = c_white;
draw_sprite_ext(s_level_on, 0, _start_draw_x + (space * 3), _start_draw_y + (2 * space) + _select_width, cursor_scale * 2, cursor_scale * 2, 45, box_color, 1);
draw_set_halign(fa_middle);

// World and level, up and down movement
for (var m = 0; m < array_length_1d(menu); m++) {
	var color = c_dkgray; // Normal drawing color of text
	if (m == menu_pos_) color = c_white;	// Change currently selected menu position color to white.
	draw_text_color(_start_draw_x + (space * 3), _start_draw_y + (m * (space * 2)) - (space * 2), string(menu[m]), color, color, color, color, 1); // Draw menu text
}

// World select
for (var w = max(world_number_, 0); w < min(world_number_ + 1, array_length_1d(world)); w++) {
	var world_color = c_dkgray;	// Normal drawing color of text
	if (menu_pos_ == 0) world_color = c_white;	// Change currently selected menu position color to white.
	draw_text_color(_start_draw_x + (space * 3) + ((w - world_number_) * space), _start_draw_y - space, string(world[w]), world_color, world_color, world_color, world_color, 1);	// Draw world number text

}

// Level select
switch (world_number_) {
    case 0: // World one
        for (var w1 = 0; w1 < array_height_2d(one); w1++ ) {
			var level_color_one = c_dkgray;	// Normal drawing color of text
			if (w1 == level_number_one_ && menu_pos_ == 1) level_color_one = c_white; // Change currently selected menu position color to white.
			draw_text_color(_start_draw_x + (space * 3) + ((w1 - level_number_one_) * space), _start_draw_y + (2 * space), string(one[w1,0]), level_color_one, level_color_one, level_color_one, level_color_one, 1); // Draw level number text
		}
        break;
	case 1 : // World two
	    for (var w2 = 0; w2 < array_height_2d(two); w2++ ) {
			var level_color_two = c_dkgray;	// Normal drawing color of text
			if (w2 == level_number_two_ && menu_pos_ == 1) level_color_two = c_white; // Change currently selected menu position color to white.
			draw_text_color(_start_draw_x + (space * 3) + ((w2 - level_number_two_) * space), _start_draw_y + (2 * space), string(two[w2, 0]), level_color_two, level_color_two, level_color_two, level_color_two, 1); // Draw level number text
		}
		break;
    default: break;
}
draw_set_halign(fa_left);

// Reset squash and stretch when the menu cursor moves
cursor_scale = approach(cursor_scale, 1, 0.1);

// Draw square where menu position is at -- some of these are 'magic numbers', used to make the sprite look good and uniform enough
//_start_draw_y +(m*(space*2))-(space*2)
draw_sprite_ext(s_select, 0, _start_draw_x + space, _start_draw_y + (menu_pos_ * (space * 2)) - (space * 2) + _select_width, cursor_scale, cursor_scale, cursor_rotate, c_white, 1);

