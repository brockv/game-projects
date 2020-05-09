/// @description GUI Logic

// Get the width and height of the GUI
var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Draw the paused screen if it exists
if (sprite_exists(paused_sprite_))
{
	draw_sprite_ext(paused_sprite_, 0, 0, 0, paused_sprite_scale, paused_sprite_scale, 0, c_white, 1);
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, _gui_width, _gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}

// Only draw health and stamina when the game is not paused
if (!paused_ && instance_exists(o_player))
{
	//draw_sprite_ext(s_hud, 0, _hud_x, _hud_y, _hud_right_edge, 1, 0, c_white, 1);
	//draw_sprite(s_hud_edge, 0, _hud_right_edge, _hud_y);

	// Draw the player's health
	for (var _i = 0; _i < o_player.player_max_health_; _i++)
	{
		var _filled = _i < o_player.player_health_;
		var _x = 4 + 15 * _i;
		var _y = 2 //_gui_height - 29;
		draw_sprite(s_heart_ui, _filled, _x, _y);
	}

	// Draw the player's stamina
	for (var _j = 0; _j < o_player.player_max_stamina_; _j++)
	{
		var _filled = _j < o_player.player_stamina_;
		var _x = 4 + 15 * _j;
		var _y = 12; //_gui_height - 18;
		draw_sprite(s_stamina_ui, _filled, _x, _y);
	}
}

// Only draw the equipment slots if the player exists, or the game is paused
if (paused_ || instance_exists(o_player))
{
	// Set the draw color to white
	draw_set_color(c_white);
	
	// Draw the equipment slots
	draw_sprite(s_inventory_box, 0, _gui_width - 66, 2); // Slot 1
	draw_text(_gui_width - 68, 28, "X"); // Slot 1 button

	draw_sprite(s_inventory_box, 0, _gui_width - 34, 2); // Slot 2
	draw_text(_gui_width - 36, 28, "Z"); // Slot 2 button

	// If there are items equipped, draw them in the appropriate equipment slots
	if (instance_exists(global.item[0])) // Slot 1
	{
		draw_sprite(global.item[0].sprite_, 0, _gui_width - 50, 18)
		if (global.item[0].show_amount_)
		{
			// Gray out the amount if it's not greater than 0
			draw_set_color(c_gray);
			if (global.item[0].amount_ > 0) draw_set_color(c_white);
			draw_text(_gui_width - 44, 22, string(global.item[0].amount_));
		}
		
		// Set the draw color back to white
		draw_set_color(c_white);
	}

	if (instance_exists(global.item[1])) // Slot 2
	{
		draw_sprite(global.item[1].sprite_, 0, _gui_width - 18, 18)
		if (global.item[1].show_amount_)
		{
			// Gray out the amount if it's not greater than 0, otherwise draw in white
			draw_set_color(c_gray);
			if (global.item[1].amount_ > 0)	draw_set_color(c_white);
			draw_text(_gui_width - 12, 22, string(global.item[1].amount_));
		}
		
		// Set the draw color back to white
		draw_set_color(c_white);
	}
}
// Call the inventory_draw script
inventory_draw(2, 2);
