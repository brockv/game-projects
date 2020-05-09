///@description Initialize variables

//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////


#region  General	
/////////////////////////////////////////////////////////////////

// Inherit from o_menu_parent
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

#region Buttons 
/////////////////////////////////////////////////////////////////

// Selected
button_	= 2;

// Total number of buttons -- initialized to 0
button_count_ = 0;

// Vertical spacing between buttons
button_gap_ = 50;

// Initialize the buttons
var	n = 0;
button_text_[n]	= " RESUME"; n++;
button_text_[n]	= " RESTART LEVEL "; n++;
button_text_[n]	= " MAIN MENU "; n++;
//button_text_[n]	= " LEVEL SELECT "; n++;
button_text_[n]	= " EXIT GAME "; n++;
button_count_	= n; // Total button count;


// Initialize the button values
for (var i = 0; i < button_count_; i++;) {
	button_x_[i]		= 0;
	button_y_[i]		= 0;
	button_scale_[i]	= 1;
	button_color_[i]	= c_white;
	button_alpha_[i]	= 1;
	button_speed_[i]	= 0;
	button_x_offset_[i]	= 0;
	button_y_offset_[i]	= 0;
	button_y_speed_[i]	= 0;
}

/////////////////////////////////////////////////////////////////
#endregion

