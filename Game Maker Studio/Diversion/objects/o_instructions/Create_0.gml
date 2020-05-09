/// @description Initialize variables

// Calculate the scale to apply to the sprites
if window_get_fullscreen() {
	// Calculate the scale based on the display width
    scale_ = 1 + floor(o_resolution.display_width_ / 500 * 0.1);
} else {
	// Calculate the scale based on the current width
    scale_ = 1 + floor(o_resolution.current_width_ / 500 * 0.1);
}

x_scale_ = (scale_ / 10) * image_xscale;
y_scale_ =  (scale_ / 10) * image_yscale;

// Display variables
gui_width_ = display_get_gui_width();
gui_height_ = display_get_gui_height();
gui_top_ = 0;

// Per resolution offsets
instructions_y_offset_ = 0;
splitters_instructions_y_offset_ = 0;
splitters_y_offset_ = 0;
filters_instructions_y_offset_ = 0;
filters_y_offset_ = 0;
switches_instructions_y_offset_ = 0;
switches_y_offset_ = 0;

#region Resolution offsets
////////////////////////////////////////////////////////////////////////////////

switch (gui_height_) {
	case 600:
		instructions_y_offset_ = 150;
		splitters_instructions_y_offset_ = 250;
		splitters_y_offset_ = 300;
		filters_instructions_y_offset_ = 240;
		filters_y_offset_ = 200;
		switches_instructions_y_offset_ = 145;
		switches_y_offset_ = 95;
		break;
	case 720:
		instructions_y_offset_ = 190;
		splitters_instructions_y_offset_ = 290;
		splitters_y_offset_ = 340;
		filters_instructions_y_offset_ = 300;
		filters_y_offset_ = 260;
		switches_instructions_y_offset_ = 185;
		switches_y_offset_ = 135;
		break;
	case 960:
		instructions_y_offset_ = 200;
		splitters_instructions_y_offset_ = 330;
		splitters_y_offset_ = 380;
		filters_instructions_y_offset_ = 440;
		filters_y_offset_ = 400;
		switches_instructions_y_offset_ = 255;
		switches_y_offset_ = 200;
		break;
	case 900: 
		instructions_y_offset_ = 200;
		splitters_instructions_y_offset_ = 330;
		splitters_y_offset_ = 380;
		filters_instructions_y_offset_ = 400;
		filters_y_offset_ = 360;
		switches_instructions_y_offset_ = 255;
		switches_y_offset_ = 200;
		break;
	case 1080:
		instructions_y_offset_ = 220;
		splitters_instructions_y_offset_ = 390;
		splitters_y_offset_ = 440;
		filters_instructions_y_offset_ = 500;
		filters_y_offset_ = 460;
		switches_instructions_y_offset_ = 285;
		switches_y_offset_ = 230;
		break;
}

////////////////////////////////////////////////////////////////////////////////
#endregion

// Instruction strings
instructions_ = "Your task is to guide laser beams to switches in the levels by using various elements "
					+ "such as splitters, filters, and a clever use of color. Elements cannot be rotated -- "
					+ "and dont need to be rotated --, so think carefully! ";
splitters_	  = "Use splitters to divert beams, and combine multiple beam colors.";
filters_	  = "Use filters to... well, filter unwanted colors.";
switches_	  = "Switches will only activate when a beam of their color is in contact with them.";
