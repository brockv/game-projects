/// @description Initialize Variables

// Font variables
draw_set_color(c_white);

font_ang_ = 0;
font_dir_ = 1;


// Check if a save file exists, and adjust menu options appropriately
if (!file_exists(o_game.file_name_))
{
	option_[0] = "SAVE GAME";
	option_[1] = "OPTIONS";
	option_[2] = "MAIN MENU";
	option_[3] = "EXIT GAME";
}
else
{
	option_[0] = "SAVE GAME";
	option_[1] = "LOAD GAME";
	option_[2] = "OPTIONS";
	option_[3] = "MAIN MENU";
	option_[4] = "EXIT GAME";
}

// Menu index
menu_index_ = 0;
