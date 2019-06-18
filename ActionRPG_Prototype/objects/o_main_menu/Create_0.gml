/// @description Initialize Variables

// Play title screen music
audio_play_sound(a_title_screen, 0, true);

// Font variables
draw_set_color(c_white);

font_ang_ = 0;
font_dir_ = 1;

// Set the room this should go to on a new game
starting_room_ = r_world;

// Menu display
title_     = "ACTION RPG";
my_message_ = "A DEMO MADE BY BROCK VANCE";

// See if the a game has been started yet and adjust menu options appropriately
var _game_started = ds_map_find_value(o_game.save_data_, "Game Started?");
if (!_game_started) /* (!file_exists(o_game.file_name_)) */ {
	option_[0] = "NEW GAME";
	option_[1] = "OPTIONS";
	option_[2] = "EXIT";
} else {
	option_[0] = "NEW GAME";
	option_[1] = "CONTINUE";
	option_[2] = "OPTIONS";
	option_[3] = "EXIT";
}

// Menu index
menu_index_ = 0;

// Menu control
NEW_GAME_ = 0;
LOAD_GAME_ = 1;
OPTIONS_ = 2;
EXIT_GAME_ = 3;
