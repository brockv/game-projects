///@arg item

var _item = singleton(argument[0]);

// Check the player's inventory for the item - no duplicates allowed
var _item_index = array_find_index(_item, global.inventory);

// If the item is not currently in the inventory already, add it
if (_item_index == -1)
{
	var _array_size = array_length_1d(global.inventory);
	for (var _i = 0; _i < _array_size; _i++)
	{
		if (global.inventory[_i] == noone)
		{
			global.inventory[_i] = _item;
			return true;
		}
	}
}
// If it's already in the inventory return out
else
{
	return true;
}

// Safety catch
return false;