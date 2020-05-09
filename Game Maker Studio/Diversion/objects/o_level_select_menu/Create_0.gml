///@description Initialize variables

#region General
/////////////////////////////////////////////////////////////////

// Inherit from o_menu_parent
event_inherited();

/////////////////////////////////////////////////////////////////
#endregion

#region Buttons 
/////////////////////////////////////////////////////////////////

// Initially selected button
button_ = 0;

// Total number of buttons -- initialized to 0
button_count_ = 0;

// Vertical spacing between buttons
button_gap_	  = 70;

// Set the initial button level
button_level_ = 1;

// Initialize the buttons
var	n = 0;
button_text_[n]	= " ONE "; n++;
button_text_[n]	= " TWO "; n++;
button_text_[n]	= " THREE "; n++;
button_text_[n]	= " FOUR "; n++;
button_text_[n]	= " FIVE "; n++;

button_text_[n]	= " SIX "; n++;
button_text_[n]	= " SEVEN "; n++;
button_text_[n]	= " EIGHT "; n++;
button_text_[n]	= " NINE "; n++;
button_text_[n]	= " TEN "; n++;

button_text_[n]	= " ELEVEN "; n++;
button_text_[n]	= " TWELVE "; n++;
button_text_[n]	= " THIRTEEN "; n++;
button_text_[n]	= " FOURTEEN "; n++;
button_text_[n]	= " FIFTEEN "; n++;

button_text_[n]	= " SIXTEEN "; n++;
button_text_[n]	= " SEVENTEEN "; n++;
button_text_[n]	= " EIGHTEEN "; n++;
button_text_[n]	= " NINETEEN "; n++;
button_text_[n]	= " TWENTY "; n++;

button_text_[n]	= " TWENTY-ONE "; n++;
button_text_[n]	= " TWENTY-TWO "; n++;
button_text_[n]	= " TWENTY-THREE "; n++;
button_text_[n]	= " TWENTY-FOUR "; n++;
button_text_[n]	= " TWENTY-FIVE "; n++;

button_text_[n]	= " TWENTY-SIX "; n++;
button_text_[n]	= " TWWENTY-SEVEN "; n++;
button_text_[n]	= " TWENTY-EIGHT "; n++;
button_text_[n]	= " TWENTY-NINE "; n++;
button_text_[n]	= " THIRTY "; n++;
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

