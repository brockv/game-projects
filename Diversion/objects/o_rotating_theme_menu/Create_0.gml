///@desc Initialize variables

// Inherit from o_rotating_menu_parent
event_inherited();

// Scale
image_xscale = 0.1;
image_yscale = 0.1;

// Background color information
layer_id_  = layer_get_id("Background");
background_id_ = layer_background_get_id(layer_id_);

light_   = make_color_rgb(124, 124, 124);
default_ = make_color_rgb(52, 51, 75);
dark_    = make_color_rgb(48, 48, 48);

// Set how wide the menu will be
x_distance_ = 50;

// Set how wide circle of the menu will be
y_distance_ = 0;

// This determines where you clicked with the left mouse click (x coordinates only)
xx = 0;

// What button is currently selected
button_ = global.background_color_button_;

// Initialize the buttons
var	n = 0;
button_text_[n]	= " LIGHT "; n++;
button_text_[n]	= " DEFAULT "; n++;
button_text_[n]	= " DARK"; n++;
button_count_	= n; // Total button count;

// Set the rotation amount and direction
rotation_amount_ = floor(360 / button_count_);
direction = 0;

// Tells the subimages in the items_spr how much to rotate.
rotating_ = 0;