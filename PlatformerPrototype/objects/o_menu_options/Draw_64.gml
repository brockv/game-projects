/// @description Draw the menu

// Set starting locations to start drawing from
var _start_draw_x = vw_ / 2 - (space * 4);	// Magic numbers ^__^
var _start_draw_y = vh_ / 2 - (space * 2);

// Draw gray box to darken the screen a bit
draw_set_alpha(0.7);
draw_rectangle_color(-10, -10, vw_ + 10, vh_ + 10, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

// Draw options menu
for (var m = 0 ; m < array_length_1d(menu_option); m++){
	// Normal drawing color of text
	var color = c_gray;
	
	// Change currently selected menu position color to white
	if (m == menu_pos_)  color = c_white;
	
	// Draw menu
	draw_text_transformed_color(_start_draw_x, _start_draw_y + (m * space), string(menu_option[m]), 1, 1, 0, color, color, color, color, 1);
}

// Draw screenshake selection
for (var s = max(screenshake_on, 0); s < min(screenshake_on + 1, array_length_1d(screenshake_on_off)); s++) {
	// Change color only if menu position is selected to be screenshake
	var screenshake_color = c_gray;	
	if (menu_pos_ == 0) screenshake_color = c_white else screenshake_color = c_gray;
	
	// Draw "On" / "Off" text
	draw_text_transformed_color(_start_draw_x + (space * 5) + s - screenshake_on, _start_draw_y, string(screenshake_on_off[s]), 1, 1, 0,
			screenshake_color, screenshake_color, screenshake_color, screenshake_color, 1);
}

// Slider colors, depending on menu position will be a brighter/darker shade to show it is selected or not
var music_color = c_gray;
var effects_color = c_gray;

// Music slider color
if (menu_pos_ == 1) {
	music_color = c_white;
} else {
	music_color = c_gray;
}

// Effects slider color
if (menu_pos_ == 2) {
	effects_color = c_white;
} else {
	effects_color = c_gray;
}

// Draw volume slider
draw_sprite_ext(s_slider_bar, 0, _start_draw_x + (space * 5), _start_draw_y + (space) + 10, 1, 1, 0, music_color, 1); // Bottom bar
draw_sprite_part_ext(s_slider_bar, 1, 0, 0, slider_width * sound_music_gain, slider_height, _start_draw_x + (space * 5), _start_draw_y + (space) + 4, 1, 1, music_color, 1); // Top bar
draw_sprite_ext(s_slider_button, 0, _start_draw_x + (space * 5) + slider_width * sound_music_gain, _start_draw_y + (space) + 10, 1, 1, 45, music_color, 1); // Button

// Draw effects slider
draw_sprite_ext(s_slider_bar, 0, _start_draw_x + (space * 5), _start_draw_y + (space * 2) + 10, 1, 1, 0, effects_color, 1); // Bottom bar
draw_sprite_part_ext(s_slider_bar, 1, 0, 0, slider_width * sound_effects_gain, slider_height, _start_draw_x + (space * 5), _start_draw_y + (space * 2) + 4, 1, 1, effects_color, 1); // Top bar
draw_sprite_ext(s_slider_button, 0, _start_draw_x + (space * 5) + slider_width * sound_effects_gain, _start_draw_y + (space * 2) + 10, 1, 1, 45, effects_color, 1); // Button

// Reset squash and stretch when menu cursor moves
cursor_scale = approach(cursor_scale, 1, 0.1);

// Draw square where menu position is at -- some of these are 'magic numbers', used to make the sprite look good and uniform enough
var _select_width = sprite_get_width(s_select) / 2;
draw_sprite_ext(s_select, 0, _start_draw_x - space, _start_draw_y + (menu_pos_ * space) + _select_width, cursor_scale, cursor_scale, 45, c_white, 1);