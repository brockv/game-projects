/// @description Initialize variables

// Background color control
//global.background_color_ = c_white;
//global.background_color_button_ = 1;

// Level unlock flags
//global.level_unlocked_ = 1;
global.current_level_ = 0;

// Menu button control
global.selected_button_ = noone;
global.last_selected_ = noone;

// Splitter grabbing
global.grabbing_ = false;

// Audio variables
//global.music_volume_ = 0.5
//global.effects_volume_ = 0.5;

// Set up the save file
file_name_ = "save_data.sav";

// If the file already exists, load it
if (file_exists(file_name_)) {
	ini_load(file_name_)
// Otherwise, create it with default values
} else {
	ini_save(file_name_);
}

// Initialize a 2D array to store the resolution options
resolution_list_[0,0] = 800;  resolution_list_[0,1] = 600;
resolution_list_[1,0] = 1280; resolution_list_[1,1] = 720;
resolution_list_[2,0] = 1280; resolution_list_[2,1] = 960;
resolution_list_[3,0] = 1440; resolution_list_[3,1] = 900;
resolution_list_[4,0] = 1600; resolution_list_[4,1] = 900;

// ---------- Display setup ---------- //

display_width_ = display_get_width();
display_height_ = display_get_height();

// Uncomment this to start in full screen
//resolution_switch();

// Choose a default windowed resolution that best fits the user's display
resolution_get_default();

display_set_gui_size(current_width_, current_height_);
