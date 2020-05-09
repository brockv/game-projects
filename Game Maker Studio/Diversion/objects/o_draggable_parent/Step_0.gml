/// @description Step logic

if (room == r_main_menu) exit;

if (mouse_check_button(mb_left) && !global.grabbing_ && in_bounds(mouse_x, mouse_y, x - 16, y - 16, x + 16, y + 16)) {
	// Set grabbed to true
	grabbed_ = true;
	active_  = false;
	outline_frame_ = 0;
	
	// This prevents multiple objects being grabbed at once
	global.grabbing_ = true;

	// Get the relative click position
	xx_ = x - mouse_x;
	yy_ = y - mouse_y;
	
} else if (!mouse_check_button(mb_left)) {
	grabbed_ = false;
	global.grabbing_ = false;
}

if (mouse_check_button(mb_left) && grabbed_) {
	// Update the objects x and y positions while keeping it on screen
	if (place_free(mouse_x, mouse_y)) {
		if ((mouse_x + xx_ > 64 && mouse_x + xx_ < room_width - 64) && (mouse_y + yy_ > 32 && mouse_y + yy_ < room_height - 32) ) {
			x = clamp(mouse_x + xx_, 64, room_width - 64);
			y = clamp(mouse_y + yy_, 64, room_height - 32);
		
			// Snap the object to the grid
			if (!place_snapped(64, 64)) {
				move_snap(64, 64);
			}
		}
	}
} else {
	grabbed_ = false;
}

// Calculate which frame of the inactive outline sprite to draw
outline_frame_ = (outline_frame_ + 1) % outline_frame_count_;