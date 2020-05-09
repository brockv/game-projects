///@desc Initialize variables

// Inherit from o_rotating_menu_parent
event_inherited();

// Scale
image_xscale = 0.1;
image_yscale = 0.1;

// Set how wide the menu will be
x_distance_ = cx; //400;

// Set how wide circle of the menu will be
y_distance_ = 0;

// This determines where you clicked with the left mouse click (x coordinates only)
xx = 0;

// What button is currently selected
button_ = 0;

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

// Set the rotation amount and direction
rotation_amount_ = floor(360 / button_count_);
direction = 0;

// Tells the subimages in the items_spr how much to rotate.
rotating_ = 0;