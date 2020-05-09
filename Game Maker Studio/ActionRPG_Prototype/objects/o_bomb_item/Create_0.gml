/// @description Initialize Variables

// Inherit from the parent item
event_inherited();

// Define item specifics
description_ = "A bomb.";
action_ = player.bomb;
show_amount_ = true;
amount_ = o_player.bombs;
max_amount_ = o_player.max_bombs;
cost_ = 0;
damage_ = 2;
