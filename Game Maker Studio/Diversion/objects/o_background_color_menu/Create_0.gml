///@description Initialize variables

//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////

#region  General	
/////////////////////////////////////////////////////////////////

// Inherit from o_menu_parent
event_inherited();

// Background color information
layer_id_  = layer_get_id("Background");
background_id_ = layer_background_get_id(layer_id_);

light_   = make_color_rgb(124, 124, 124);
default_ = make_color_rgb(52, 51, 75);
dark_    = make_color_rgb(48, 48, 48);
				

// Set the pause flag to false initially
paused_	= false;

// Initialize a variable to store the paused screen sprite in
paused_sprite_ = noone;

// Alpha variables
screen_alpha_	  = 0;
screen_alpha_set_ = 0;


/////////////////////////////////////////////////////////////////
#endregion

#region Buttons 
/////////////////////////////////////////////////////////////////

// Selected
button_	= global.background_color_button_;

// Total number of buttons -- initialized to 0
button_count_ = 0;

// Vertical spacing between buttons
button_gap_ = 50;

// Initialize the buttons
var	n = 0;
button_text_[n]	= " LIGHT "; n++;
button_text_[n]	= " DEFAULT "; n++;
button_text_[n]	= " DARK "; n++;
button_count_	= n; // Total button count;

rot_ammount = 360 / button_count_;

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

