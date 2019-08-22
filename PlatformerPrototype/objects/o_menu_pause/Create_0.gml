/// @description Initialize variables

// Pause array
menu_pause[0] = "Unpause";		// Unpause the game
menu_pause[1] = "Level Select";	// Create level select menu
menu_pause[2] = "Options";		// Create options menu
menu_pause[3] = "Quit";			// Create quit menu

space_		= 32;	// Space between each menu option
menu_pos_   = 0;	// Where the menu selection currently is

// Cursor effects
cursor_scale_ = 1;
cursor_rotate_ = 45;

// View dimensions used for drawing menu options
vw_ = display_get_gui_width(); //camera_get_view_width(view_camera[0]);
vh_ = display_get_gui_height(); //camera_get_view_height(view_camera[0]);