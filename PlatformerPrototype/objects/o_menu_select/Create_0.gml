/// @description Initialize variables

// Initialize the lights alarm
alarm[1] = 60;

// Create menu array
menu[0] = "Start";		  // Go to first level, or last level played
menu[1] = "Level Select"; // Create level select to select level to go to
menu[2] = "Options";	  // Create options menu
menu[3] = "Quit";		  // Create quit menu

space_		= 32;	// Space between each menu option
menu_pos_   = 0;	// Represents where the menu selection currently is

// Cursor effects
cursor_scale = 1;	// Grow cursor when moving
cursor_rotate = 45;
