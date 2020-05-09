/// @description Game Start Logic

// Set the initial window size
window_set_size(display_get_width() / 1.5, display_get_height() / 1.5);

// Call the alarm to center the window
alarm[0] = global.one_second / 50;

// Go to the menu screen
room_goto(r_main_menu);


