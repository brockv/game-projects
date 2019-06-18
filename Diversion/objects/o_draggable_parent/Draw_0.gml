/// @description Draw logic

// Draw the appropriate outline
if (grabbed_) {
	// The object has been grabbed, draw the selected outline
	draw_sprite(s_selected_outline, 0, x, y);
}

