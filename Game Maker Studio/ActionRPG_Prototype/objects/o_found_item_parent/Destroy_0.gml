/// @description Destroy Logic

// Equip the item if possible
if (global.item[0] == noone) // First equipment slot
{
	inventory_add_item(item_found_);
	global.item[0] = item_found_;
}
else if (global.item[1] == noone) // Second equipment slot
{
	inventory_add_item(item_found_);
	global.item[1] = item_found_;
}
else
{
	inventory_add_item(item_found_); // Both slots were full, add to inventory instead
}

// Create an effect when destroyed
create_animation_effect(s_gem_shine_effect, x, y - 25, 1, false);

// Set the player's state back
o_player.state_ = player.move;
