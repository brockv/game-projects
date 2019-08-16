/// @description Initialize variables

part_sys = part_system_create();
part_system_draw_order(part_sys, true);
body_emitter = part_emitter_create(part_sys);

jump_part = part_type_create();
part_type_shape(jump_part, pt_shape_sphere);
part_type_size(jump_part, 0.5, 1, -0.05, 0);
part_type_speed(jump_part, 1, 3, 0, 0);
part_type_direction(jump_part, 160, 380, 0, 10);
part_type_color1(jump_part, c_white);
part_type_life(jump_part, room_speed/2, room_speed);

part_particles_create(part_sys, x, y, jump_part, 15);
alarm[0] = room_speed / 2;
//// Amount of burst particles
//amount = 20;

//// Create burst effect with an array
//for (var i = amount; i > 0; i-- ) {
//	xx[i]		= x + random_range(-3, 3);	// Starting x location is random for each particle
//	yy[i]		= y + random_range(0, 3);	// Starting y location is random for each particle
//	xspd[i]		= random_range(-2, 2);		// Random speed particle will move on the x axis
//	yspd[i]		= random_range(0.5, 1);		// Each particle will move at a different speed upwards
//	rot[i]		= 0;						// Every particle starts at zero
//	rot_dir[i]	= choose(-1, 1)				// Choose random direction particle will rotate in
//	sprite[i]	= choose(s_wall_slide_hollow_cube, s_wall_slide_cube, s_wall_slide_cube); // Choose sprites for each particle
//	alpha[i]	= 1;						// Each particle has a different alpha
//}