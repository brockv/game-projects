///@desc Initialize variables

// Position variables
gui_width_	= display_get_gui_width();
gui_height_	= display_get_gui_height();
cx			= gui_width_ / 2;
cy			= gui_height_ / 2;

// Initialize the menu sounds
sound[0] = a_menu_move; //Scroll through buttons
sound[1] = a_menu_select; //Confirm
