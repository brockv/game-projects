/// @description Initialize Variables

// Set the resolution of the GUI
var _view_width = camera_get_view_width(view_camera[0]);
var _view_height = camera_get_view_height(view_camera[0]);
display_set_gui_size(_view_width, _view_height);

// Add a pause variables
paused_ = false;
paused_sprite_ = noone;
paused_sprite_scale = display_get_gui_width() / view_wport[0];

// Create the player's inventory and equipment slots
global.item[0] = noone;
global.item[1] = noone;
item_index_ = 0;
inventory_create(6);

// ------------ DEBUG ONLY ------------ //

//// Add an item to the inventory
//inventory_add_item(o_sword_item);
//inventory_add_item(o_fire_sword_item);
//inventory_add_item(o_ring_item);
//inventory_add_item(o_bomb_item);
