///@arg input
///@arg item
///@arg damage

var _input = argument[0];
var _item = argument[1];
var _damage = argument[2];

// Check the direction we are currently facing
var _x_dir = lengthdir_x(6, direction_facing_ * 90);
var _y_dir = lengthdir_y(6, direction_facing_ * 90);

// Exit item use if there's an interactable object immediately in front of us
if (instance_place(x + _x_dir, y + _y_dir, o_interactable_parent)) exit;

// Check for input
if (_input)
{
	// If input exists, check for an item in the corresponding slot
	if (instance_exists(_item))
	{
		// An item exists, check if the player has the required stamina
		if (player_stamina_ >= _item.cost_)
		{
			// If the item has a shown amount, make sure the count isn't 0
			if (_item.show_amount_)
			{
				if (_item.amount_ > 0)
				{
					// Execute the appropriate state
					state_ = _item.action_;
			
					// Use the appropriate damage modifier
					sword_damage_ = _damage;
			
					// Apply the stamina cost
					player_stamina_ -= _item.cost_;
				
					_item.amount_ = max(_item.amount_ - 1, 0);
				}
			}
			else
			{
				// Execute the appropriate state
				state_ = _item.action_;
			
				// Use the appropriate damage modifier
				sword_damage_ = _damage;
			
				// Apply the stamina cost
				player_stamina_ -= _item.cost_;
			}
			
				// Set the stamina regen alarm
				alarm[2] = global.one_second * stamina_regen_time_;
		
				// Reset the image index
				image_index = 0;
		}
	}
}