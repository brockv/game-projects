///@arg x
///@arg y

// Only draw inventory when the game is paused
if (!o_hud.paused_) exit;

var _x = argument[0];
var _y = argument[1];

// Get the current size of the inventory
var _array_size = array_length_1d(global.inventory);

// Draw the inventory boxes and items
for (var _i = 0; _i < _array_size; _i++)
{
	// Boxes
	var _box_x = _x + _i * 32;
	var _box_y = _y;
	draw_sprite(s_inventory_box, 0, _box_x, _box_y);
	
	// Items
	var _item = global.inventory[_i];
	if (instance_exists(_item))
	{
		draw_sprite(_item.sprite_, 0, _box_x + 16, _box_y + 16);
		
		// If this item is consumable, draw the remaining amount
		if (_item.show_amount_)
		{
			// Gray out the amount if it's not greater than 0, otherwise draw in white
			draw_set_color(c_gray);
			if (_item.amount_ > 0) draw_set_color(c_white);
			draw_text(_box_x + 22, _box_y + 20, string(_item.amount_));
		}
		
		// Set the draw color back to white
		draw_set_color(c_white);
	}
	
	// Cursor
	if (_i == item_index_)
	{
		draw_sprite(s_inventory_cursor, image_index / 8, _box_x, _box_y);
		
		// Draw the item details for whatever the cursor is on
		if (instance_exists(_item))
		{
			draw_text(_x + 4, _y + 36, _item.description_);
			var _description_height = string_height(_item.description_);
			var _yy = 48;
			if (_item.cost_ >= 1)
			{
				draw_text(_x + 4, _y + _yy + _description_height, "Stamina Cost: " + string(_item.cost_));
				_yy += 12;
			}
			if (_item.damage_ >= 1)
			{
				draw_text(_x + 4, _y + _yy + _description_height, "Damage: " + string(_item.damage_));
			}
		}
	}
	
	// Get the width and height of the GUI
	var _gui_width = display_get_gui_width();
	var _gui_height = display_get_gui_height();
	
	// Get the player's current gem count and convert it to a string
	var _gem_count = ds_map_find_value(o_game.save_data_, "Gem Count");
	var _gem_string = string(_gem_count);

	// Get the width of the string
	var _text_width = string_length(_gem_string);

	// Determine the x and y position to draw it to the GUI
	var _gem_x = _gui_width - _text_width + 4;
	var _gem_y = _gui_height - 16 + 4;

	// Draw the player's gem count
	draw_sprite(s_gem, 0, _gem_x - 26, _gem_y + 7);
	draw_text(_gem_x - 18, _gem_y - 1, _gem_string);
}
