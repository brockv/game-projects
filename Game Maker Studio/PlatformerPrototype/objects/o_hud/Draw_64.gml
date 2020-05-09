/// @description GUI logic

// Don't bother drawing this stuff if we're not playing
if (room = rm_menu) exit;

// Get the width and height of the GUI
var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Only draw the light gauge when the game is not paused
if (!pause && instance_exists(o_player)) {
	//draw_sprite_ext(s_hud, 0, _hud_x, _hud_y, _hud_right_edge, 1, 0, c_white, 1);
	//draw_sprite(s_hud_edge, 0, _hud_right_edge, _hud_y);
	draw_healthbar((_gui_width / 2) - o_player.effect_shine_max_timer_/2,
					5, 
				   (_gui_width / 2) + o_player.effect_shine_max_timer_,
				   15, ((o_player.effect_shine_timer_ - 64) * 100) / o_player.effect_shine_max_timer_,
				   c_black, c_white, c_white, 0, false, false);
				   
// WHen the game is paused, draw the rest of the HUD
} else {
	// TO-DO: make this not suck
	if (instance_number(o_gem_special_blue_pickup) > 0) {
		draw_sprite_ext(s_gem_special_blue, 0, _gui_width / 2 - (32 * 3), _gui_height - 40, 1, 1, 1, c_white, 0.2);
	} else {
		draw_sprite_ext(s_gem_special_blue, 0, _gui_width / 2 - (32 * 3), _gui_height - 40, 1, 1, 1, c_white, 1);
	}
	
	if (instance_number(o_gem_special_green_pickup) > 0) {
		draw_sprite_ext(s_gem_special_green, 0, _gui_width / 2, _gui_height - 40, 1, 1, 1, c_white, 0.2);
	} else {
		draw_sprite_ext(s_gem_special_green, 0, _gui_width / 2, _gui_height - 40, 1, 1, 1, c_white, 1);
	}
	
	if (instance_number(o_gem_special_orange_pickup) > 0) {
		draw_sprite_ext(s_gem_special_orange, 0, _gui_width / 2 + (32 * 3), _gui_height - 40, 1, 1, 1, c_white, 0.2);
	} else {
		draw_sprite_ext(s_gem_special_orange, 0, _gui_width / 2 + (32 * 3), _gui_height - 40, 1, 1, 1, c_white, 1);
	}
}

if (room != rm_menu) {
	// Get the player's current gem count and convert it to a string
	var _gem_count = instance_number(o_gem_pickup);
	var _gem_string = string(_gem_count);
	
	// Determine which color to draw the amount with
	var _color = c_white;
	//if (_gem_count = 0) _color = c_gray;
	
	// Get the width of the string
	var _text_width = string_length(_gem_string);

	// Determine the x and y position to draw it to the GUI
	var _gem_x = _gui_width - _text_width + 4;
	var _gem_y = 10;

	// Draw the player's gem count
	draw_sprite(s_gem, 0, _gem_x - 50, _gem_y + 7);
	draw_text(_gem_x - 42, _gem_y - 5, ":");
	draw_text_color(_gem_x - 30, _gem_y - 5, _gem_string, _color, _color, _color, _color, 1);
}