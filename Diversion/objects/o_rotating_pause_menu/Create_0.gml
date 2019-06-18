///@desc Initialize variables

#region  General	
/////////////////////////////////////////////////////////////////

// Inherit from o_rotating_menu_parent
event_inherited();

// Set the pause flag to false initially
paused_		= false;

// Initialize a variable to store the paused screen sprite in
paused_sprite_ = noone;

// Alpha variables
screen_alpha_		= 0;
screen_alpha_set_	= 0;

/////////////////////////////////////////////////////////////////
#endregion

// Adjust the scale
image_xscale = 0.1;
image_yscale = 0.1;

// Set how wide the menu will be
x_distance_ = 150;

// Set how wide circle of the menu will be
y_distance_ = 0;

// This determines where you clicked with the left mouse click (x coordinates only)
xx = 0;

// What button is currently selected
button_ = 0;

// Initialize the buttons
var n = 0;
button_text_[n]	= " RESUME"; n++;
button_text_[n]	= " RESTART LEVEL "; n++;
button_text_[n]	= " MAIN MENU "; n++;
button_text_[n]	= " LEVEL SELECT "; n++;
button_text_[n]	= " EXIT GAME "; n++;
button_count_	= n; // Total button count;

// Set the rotation amount and direction
rotation_amount_ = floor(360 / (button_count_));
direction = 0;

// Tells the subimages in the items_spr how much to rotate.
rotating_ = 0;