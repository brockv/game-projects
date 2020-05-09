/// @description Screenshake

// Reset screenshake

// Activate screenshaker on timer
if screenshake { // Check if screenshake is active, and run screenshake
	screenshake_timer -= 1; // Decrement screenshake active timer
}

// If screenshake active timer is less than zero, disable screenshake and reset timers
if screenshake_timer <= 0 {
	screenshake = 0; // Disable screenshake
	screenshake_timer= screenshake_max_timer; // Reset timer
}

// Camera screenshake
if screenshake_on {	// Check if screenshake is on
	if screenshake { // Check if screenshake is active
		screenshake_amount_x = irandom_range(-4,4);	// Move the camera on the x axis
		screenshake_amount_y = irandom_range(-4,4);	// Move the camera on the y axis
	}
	
	// Center the screenshake
	screenshake_amount_x = approach(screenshake_amount_x,0,0.1);
	screenshake_amount_y = approach(screenshake_amount_y,0,0.1);
}