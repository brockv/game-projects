/// @description Initialize variables

event_inherited();

// Create menu array
menu_quit[0] = "No";  // 'No' / 'Cancel' option
menu_quit[1] = "Yes"; // 'Yes' / 'Confirm' option

space_	  = 32;	// Space between each menu option
menu_pos_ = 0;	// Represents where the menu selection currently is

// Cursor effects
cursor_scale  = 1;
cursor_rotate = 45;