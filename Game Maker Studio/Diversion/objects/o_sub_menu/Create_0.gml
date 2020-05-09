///@description Initialize variables

#region General
/////////////////////////////////////////////////////////////////

// Inherit from o_menu_parent
event_inherited();

/////////////////////////////////////////////////////////////////
#endregion

#region Buttons 
/////////////////////////////////////////////////////////////////

// Selected
button_		  = 0;

// Total number of buttons -- initialized to 0
button_count_ = 0;

// Vertical spacing between buttons
button_gap_	  = 50;

// Initialize the buttons
var	n = 0;
button_text_[n]	= " MAIN MENU "; n++;
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

