/// @description Draw the options

// Display variables
gui_width_ = display_get_gui_width();
gui_height_ = display_get_gui_height();
gui_top_ = gui_height_ - gui_height_;

#region Resolution offsets
////////////////////////////////////////////////////////////////////////////////

switch (gui_height_) {
	case 600:
		audio_y_offset_ = 100;
		effects_instructions_y_offset_ = 200;
		resolution_y_offset_ = 300;
		theme_instructions_y_offset_ = 440;
		break;
	case 720:
		audio_y_offset_ = 120;
		effects_instructions_y_offset_ = 200;
		resolution_y_offset_ = 360;
		theme_instructions_y_offset_ = 530;
		break;
	case 900: 
		audio_y_offset_ = 150;
		effects_instructions_y_offset_ = 300;
		resolution_y_offset_ = 470;
		theme_instructions_y_offset_ = 670;
		break;
	case 960:
		audio_y_offset_ = 150;
		effects_instructions_y_offset_ = 300;
		resolution_y_offset_ = 480;
		theme_instructions_y_offset_ = 700;
		break;
	case 1080:
		audio_y_offset_ = 150;
		effects_instructions_y_offset_ = 250;
		resolution_y_offset_ = 300;
		theme_instructions_y_offset_ = 240;
		break;
}

////////////////////////////////////////////////////////////////////////////////
#endregion


draw_set_font(f_large);
draw_text(gui_width_ / 2, gui_top_ + 30, "Options");
draw_text(gui_width_ / 2, gui_top_ + 60, "----------------");

// Set the font
draw_set_font(f_selected);

// -- Draw the general instructions -- //

// Audio
draw_text(gui_width_ / 2, gui_top_ + audio_y_offset_, "Music Volume");
//draw_text(gui_width_ / 2, gui_top_ + audio_y_offset_, "----------------");

// Effects
draw_text(gui_width_ / 2, gui_top_ + effects_instructions_y_offset_, "Effects Volume");
//draw_text(gui_width_ / 2, gui_top_ + effects_instructions_y_offset_, "----------------");

// Background color
draw_text(gui_width_ / 2, gui_top_ + resolution_y_offset_, "Resolution");
//draw_text(gui_width_ / 2, gui_top_ + resolution_y_offset_, "----------------");

// Resolution
draw_text(gui_width_ / 2, gui_top_ + theme_instructions_y_offset_, "Theme");
//draw_text(gui_width_ / 2, gui_top_ + theme_instructions_y_offset_, "----------------");