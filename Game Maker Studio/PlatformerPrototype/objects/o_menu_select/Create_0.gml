/// @description Initialize variables

// Initialize the lights alarm
alarm[1] = 60;

// Create menu array
menu_[0] = "Start";		  // Go to first level, or last level played
menu_[1] = "Level Select"; // Create level select to select level to go to
menu_[2] = "Options";	  // Create options menu
menu_[3] = "Quit";		  // Create quit menu

space_		= 32;	// Space between each menu option
menu_pos_   = 0;	// Represents where the menu selection currently is

// Cursor effects
cursor_scale_ = 1;	// Grow cursor when moving
cursor_rotate_ = 45;
