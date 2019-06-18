/// @description Initialize variables


// Current options: screenshake, volume sliders

// Options in the menu
menu_option[0] = "Screenshake: " ;
menu_option[1] = "Music Volume: ";
menu_option[2] = "Effects Volume: ";

// Menu position
menu_pos_ = 0; // Start at top of menu
space = 32;	   // Space between each menu option

// "On" or "Off" array text
screenshake_on_off[0] = "Off";
screenshake_on_off[1] = "On";

// Slider properties
slider_width  = sprite_get_width(s_slider_bar);
slider_height = sprite_get_height(s_slider_bar);

// Cursor effects
cursor_scale = 1; // Grow cursor when moving