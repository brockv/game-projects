/// @description Initialize variables

// Amount of burst particles
amount = 10;

// Create burst effect with an array
for (var i = amount; i > 0; i-- ) {
	xx[i]		= x + random_range(-3, 3);	// Starting x location	is random for each particle
	yy[i]		= y + random_range(0, 3);	// Starting y location is random for each particle
	xspd[i]		= random_range(-2, 2);		// Random speed particle will move on the x axis.
	yspd[i]		= random_range(0.5, 1);		// Each particle will move at a different speed upwards.
	rot[i]		= 0;						// Every particle starts at zero
	rot_dir[i]	= choose(-1, 1)				// Choose random direction particle will rotate in.
	sprite[i]	= choose(s_wall_slide_hollow_cube, s_wall_slide_cube, s_wall_slide_cube, s_wall_slide_cube); // Choose sprites for each particle
	alpha[i]	= 1;						// Each particle has a different alpha
}