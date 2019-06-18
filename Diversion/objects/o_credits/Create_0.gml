/// @description Initialize variables

// Display variables
gui_width_ = display_get_gui_width();
gui_height_ = display_get_gui_height();
gui_top_ = 0;

// Per resolution offsets
music_y_offset_ = 0;
font_y_offset_ = 0;
creator_y_offset_ = 0;

#region Resolution offsets
////////////////////////////////////////////////////////////////////////////////

switch (gui_height_) {
	case 600:
		music_y_offset_ = 130;
		font_y_offset_ = 270;
		creator_y_offset_ = 410;
		break;
	case 720:
		music_y_offset_ = 140;
		font_y_offset_ = 320;
		creator_y_offset_ = 510;
		break;
	case 960:
		music_y_offset_ = 220;
		font_y_offset_ = 440;
		creator_y_offset_ = 630;
		break;
	case 900: 
		music_y_offset_ = 200;
		font_y_offset_ = 410;
		creator_y_offset_ = 610;
		break;
	case 1080:
		music_y_offset_ = 220;
		font_y_offset_ = 390;
		creator_y_offset_ = 440;
		break;
}

#endregion
