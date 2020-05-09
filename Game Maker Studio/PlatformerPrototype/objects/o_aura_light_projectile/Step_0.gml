/// @description Step logic

// Horizontal collision
if (place_meeting(x + hspd_, y, o_par_collision)) {
	while (!place_meeting(x + sign(hspd_), y, o_par_collision)) {
		x += sign(hspd_);
	}
	h_collision_ = true;
	//instance_destroy();
}


x += hspd_;

// Vertical collision
if (place_meeting(x, y + vspd_, o_par_collision)) {
	while (!place_meeting(x, y + sign(vspd_), o_par_collision)) {
		y += sign(vspd_);
	}
	v_collision_ = true;
	//instance_destroy();
}

y += vspd_;

// Check collision flags and only run the statement if it's the first time being triggered_
if ((h_collision_ || v_collision_) && !triggered_) {
	// Set the trigger flag to true and set the movement variables to 0 -- (stopping it where it is)
	triggered_ = true;
	hspd_ = 0;
	vspd_ = 0;
	
	// Expand the light radius_ and set the delay alarm
	radius_ = expanded_radius;
	alarm[2] = room_speed * 2;
}

// Destroy the light if the lifespan alarm expires
if (alarm[1] <= 0 && !triggered_) {
	instance_destroy();
}