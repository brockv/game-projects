///@desc Initialize variables

// Inherit from o_rotating_menu_parent
event_inherited();

image_xscale = 0.1;
image_yscale = 0.1;

// Idle alarm
alarm[0]   = room_speed * 10;
menu_idle_ = false;
col_one_   = noone;
col_two_   = noone;


// Set how wide the menu will be
x_distance_ = 200;

// Set how wide circle of the menu will be
y_distance_ = 0;

// This determines where you clicked with the left mouse click (x coordinates only)
xx = 0;

// What button is currently selected
button_ = 2;

// Initialize the buttons
var	n = 0;
button_text_[n]	= " OPTIONS "; n++;
button_text_[n]	= " INSTRUCTIONS "; n++;
button_text_[n]	= " LEVEL SELECT"; n++;
button_text_[n]	= " CREDITS "; n++;
button_text_[n]	= " EXIT GAME "; n++;
button_count_	= n; // Total button count;

// Set the rotation amount and direction
rotation_amount_ = floor(360 / button_count_);
direction = 0;

// Tells the subimages in the items_spr how much to rotate.
rotating_ = 0;