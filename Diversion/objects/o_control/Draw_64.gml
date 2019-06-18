/// @description Draw logic

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
		theme_instructions_y_offset_ = 480;
		text_offset_ = 40;
		break;
	case 720:
		audio_y_offset_ = 120;
		effects_instructions_y_offset_ = 200;
		resolution_y_offset_ = 360;
		theme_instructions_y_offset_ = 530;
		text_offset_ = 48;
		break;
	case 900: 
		audio_y_offset_ = 150;
		effects_instructions_y_offset_ = 300;
		resolution_y_offset_ = 470;
		theme_instructions_y_offset_ = 670;
		text_offset_ = 40;
		break;
	case 960:
		audio_y_offset_ = 150;
		effects_instructions_y_offset_ = 300;
		resolution_y_offset_ = 480;
		theme_instructions_y_offset_ = 700;
		text_offset_ = 65;
		break;
	case 1080:
		audio_y_offset_ = 150;
		effects_instructions_y_offset_ = 250;
		resolution_y_offset_ = 300;
		theme_instructions_y_offset_ = 240;
		text_offset_ = 40;
		break;
}

////////////////////////////////////////////////////////////////////////////////
#endregion

// Set draw variables
draw_set_font(f_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);

// Resolution text
if window_get_fullscreen() {
	var _text = "N / A";
} else {
	var _text = string(o_resolution.resolution_list_[resolution_selected_, 0]) + " x " + string(o_resolution.resolution_list_[resolution_selected_, 1]);
}

draw_set_colour(c_black);
draw_text(gui_width_ / 2, gui_top_ + resolution_y_offset_ + text_offset_, string_hash_to_newline(_text));
draw_set_colour(c_white);
draw_text(gui_width_ / 2, gui_top_ + resolution_y_offset_ + text_offset_, string_hash_to_newline(_text));

