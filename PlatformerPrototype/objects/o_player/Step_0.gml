/// @description Move player based on input and collisions

// If the game is paused, don't run any of the code below this
if (pause) exit;

#region // Dash and jump buffer timer
// Disable input after dash and wall jump with delay timers
wall_jump_delay	= max(wall_jump_delay - 1, 0);
dash_delay		= max(dash_delay - 1, 0);
#endregion

#region // Reset jump and dash when touching ground
// Check if the player is on the ground or on a jump-through platform, but *not* inside a jump-through
if (player_on_ground || player_on_jt && !player_inside_jt) { 
	player_jumped	= 0;	// Reset jump
	jump_off_timer	= jump_off_max_timer; // Reset jump buffer -- number of frames the player has to still jump afer falling of a ledge
	player_dashed  = 0;		// Reset dash
} else {
	// Jump delay buffer timer
	jump_off_timer -= 1;
}
#endregion

#region // Dash
// Get the direction of the dash
dash_direction = point_direction(0, 0, h_input_dir, v_input_dir);

// Check if the dash key pressed and the player hasn't already dashed
if (k_dash && !player_dashed) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_dash, false, 7);
	
	// Squash and stretch
	scale_x = 0.4;
	scale_y = 0.5;
	
	// Dash flag and timer
	player_dashed	= true; // player has dashed
	dash_delay		= dash_delay_max;
	
	// Ensure we have a direction to dash in, else we will simply dash in the direction the player is facing
	if dash_direction != 0 {
		hsp_d = lengthdir_x(dash_length, dash_direction);
		vsp_d = lengthdir_y(dash_length, dash_direction);
	} else {
		hsp_d = lengthdir_x(dash_length * facing, dash_direction);
		vsp_d = lengthdir_y(dash_length, dash_direction);
	}
	
	// Reset fractions
	hsp_d_frac = 0;
	vsp_d_frac = 0;
}
#endregion

#region // Wall Jump

// If the player is on a wall and in the air, and the jump key is pressed, move the player
if (player_on_wall != 0) && (!player_on_ground) && (k_jump_pressed) && (!player_on_jt || player_inside_jt) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_jump, false, 7);
	
	// Jump flag and timer
	player_jumped = true;	// Set jump flag
	wall_jump_delay = wall_jump_delay_max;	// Reset wall jump delay timer -- for no key input
	
	// Update the player's speed with jump variables
	hsp_d = -player_on_wall * hsp_d_wall_jump_length;	// Apply jump height to hsp_eed
	vsp_d = vsp_d_wall_jump_height;					// Apply jump distance to vsp_eed
	
	// Squash and stretch
	scale_x = 0.5;
	scale_y = 1.4;
	
	// Reset fractions
	hsp_d_frac	= 0;
	vsp_d_frac	= 0;

	// Create particle effects when jumping
	if !instance_exists(o_effect_jump_burst) instance_create_layer(x, y, "player", o_effect_jump_burst);
} else {
	// Lower jump height when the jump key/button is released before the maximum jump height was reached.
	if ((k_jump_released) && (!player_on_ground) && (!player_jumped) && (vsp_d < 0)) {
		vsp_d *= 0.25; 
	}
}
#endregion

#region // Normal jump
if (k_jump_pressed) && (!player_jumped) && (jump_off_timer > 0) && (!player_down_check) {
	// Play a sound effect
	
	audio_play_sound_on(emitter_sound_effects, a_jump, false, 7);	
	
	// Squash and stretch
	scale_x	= 0.2;
	scale_y	= 1.8;
	
	// Jump height
	vsp_d		= vsp_d_jump;
	vsp_d_frac	= 0; // Reset fraction
	
	// Jump flag
	player_jumped = true; // The player has jumped
	
	// Create a particle effect when jumping
	if (!instance_exists(o_effect_jump_burst)) instance_create_layer(x, y, "player", o_effect_jump_burst);
} else {
	// Lower jump height when the jump key/button is released before the maximum jump height was reached.
	if (k_jump_released)  && (vsp_d < 0) {
		vsp_d *= 0.25;
	}
}
#endregion

#region // Limit hsp_eed and vsp_eed velocities based on what the player is doing
/* Change vsp_d max velocity based on whether the player is going up or down.
   Since jumping is usually a higher velocity than falling we dont want the player restricted to the same rules as falling. */

// Going down, falling normally
if (vsp_d > 0 ) {
	vsp_d_dir_vel = vsp_d_max_fall_speed;
// Going down up, typically change for jumping speed
} else {
	vsp_d_dir_vel = vsp_d_max_jump;
}

// If the player has dashed, change limits of speed to dash speed.
if (dash_delay > 0 ) {
	final_max_hsp_d = hsp_d_max_dash;
	final_max_vsp_d = vsp_d_max_dash;
	final_acc	= 0;
	final_fric	= 0;
	final_grav_  = grav__dash;
// If player has not dashed, use normal max velocities.
} else {
	// The player is on the ground
	if (player_on_ground || player_on_jt && !player_inside_jt) {
		final_max_hsp_d	= hsp_d_max_ground;
		final_max_vsp_d	= vsp_d_dir_vel;
		// The player is on ice
		if (player_on_ice) {
			final_acc		= hsp_d_acc_ice;
			final_fric		= hsp_d_fric_ice;
		// The player is not on the ice
		} else {
			final_acc		= hsp_d_acc_ground;
			final_fric		= hsp_d_fric_ground;	
		}
		final_grav_		= 0;
	// The player is not on the ground
	} else {
		final_max_hsp_d	= hsp_d_max_air;
		final_max_vsp_d	= vsp_d_dir_vel;
		final_acc		= hsp_d_acc_air;
		final_fric		= hsp_d_fric_air;
		final_grav_		= grav__air;
		
		// If the player is on a wall, redefine max speeds //
		
		// Check if the player is wall jumping
		if (wall_jump_delay > 0 ) {
			final_grav_ = grav__air;
		// The player is not wall jumping
		} else {
			// Check if the player is on a wall and has pressed a key against it
			if ((player_on_wall != 0) && (h_input_dir != 0) && (h_input_dir == player_on_wall)) {
				// Check if the player is going up against a wall
				if vsp_d < 0 {
					final_max_vsp_d  = vsp_d_max_wall_slide_spd ;
					final_grav_	= grav__air;
				// Check if the player is going down against a wall
				} else {
					final_max_vsp_d  = vsp_d_max_wall_slide_spd ;
					final_grav_	= grav__wall;
				}
			// Have the player fall normally next to a wall -- set normal grav_ity since the player is not pushing up against the wall
			} else {
				final_max_vsp_d	= vsp_d_dir_vel;
				final_grav_		= grav__air;
			}
		}
	}	
}
#endregion

#region // Apply forces(grav_ity, acceleration, friction) to hsp_eed and vsp_eed
// Apply final friction,acceleration and grav_ity to player, and move the player based on input //

// Disable input if player has wall jumped
if (wall_jump_delay <= 0 ) {
	hsp_d += (h_input_dir * final_acc); // Only move the player horizontally if they haven't wall jumped
}

// Apply grav_ity to the player
vsp_d += final_grav_;

// Apply friction to the player if no input is detected
if (h_input_dir == 0) {
	hsp_d = approach(hsp_d, 0, final_fric);
}
#endregion

#region // Dump fractions
/* Fractions are used to have pixel perfect collisions and movement --
   Only dump fractions if the player's initial velocity has exceeded one (1) */

// Add the fraction values to hsp_d and vsp_d
hsp_d += hsp_d_frac;
vsp_d += vsp_d_frac;

// Get the fraction value from hsp_d
if (hsp_d >= 1 || hsp_d <= -1) hsp_d_frac = frac(hsp_d);
//hsp_d_frac = frac(hsp_d); // Substitute this line for the one above to remove the player's initial velocity

// Get the fraction value from vsp_d
vsp_d_frac = frac(vsp_d);

// Subtract the fraction from the original number, making it a whole number
hsp_d -= hsp_d_frac;
vsp_d -= vsp_d_frac;
#endregion

#region // Check for collisions
// Horizontal collision check
if (place_meeting(x + hsp_d, y, o_collision_block)) {
	// Get the direction the player is moving in ( 1 for right, -1 for left, 0 for no horizontal movement)
	var one_pixelx = sign(hsp_d);
	
	// Move the player in their current direction as long as they aren't colliding with a block
	while (!place_meeting(x + one_pixelx, y, o_collision_block)) {
		x += one_pixelx;	
	}
	
	// Set hsp_d variables to 0 once we're colliding with a block
	hsp_d		= 0;
	hsp_d_frac	= 0;
}

// Vertical collision check
if (place_meeting(x, y + vsp_d, o_collision_block)) {
	// Get the direction the player is moving in ( 1 for down, -1 for up, 0 for no vertical movement)
	var one_pixely = sign(vsp_d);
	
	// Move the player in their current direction as long as they aren't colliding with a block
	while (!place_meeting(x,y+one_pixely,o_collision_block)) {
		y += one_pixely;	
	}
	
	// Set vsp_d variables to 0 once we're colliding with a block
	vsp_d		= 0;
	vsp_d_frac	= 0;
}
// Platform collisions
// Checks if the player is moving down and colliding with a platform, but currently not inside it
if ((vsp_d > 0 && place_meeting(x, y + vsp_d, o_jump_through_wood)) && (!place_meeting(x, y, o_jump_through_wood))) {
	// Get the direction the player is moving in ( 1 for down, -1 for up, 0 for no vertical movement)
	var one_pixely = sign(vsp_d);
	
	// Move the player in their current direction as long as they aren't colliding with a platform
	while (!place_meeting(x, y + one_pixely, o_jump_through_wood)) {
		y += one_pixely;	
	}
	
	// Set vsp_d variables to 0 once we're colliding with a platform
	vsp_d		= 0;
	vsp_d_frac	= 0;
}
#endregion

#region // Jump down platforms
// Fall down through a platform
if (player_down_check && k_jump_pressed && player_on_jt && !player_inside_jt && !player_on_ground) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_jump, false, 7);	
	y++;
}
#endregion

#region // Clamp speeds and move player object
// Clamp the maximum speeds the player can move at
hsp_d = clamp(hsp_d, -final_max_hsp_d, final_max_hsp_d);
vsp_d = clamp(vsp_d, -final_max_vsp_d, final_max_vsp_d);

// Move the player's x and y position
x += hsp_d;
y += vsp_d;
#endregion

#region // Check for landing, then squash and stretch the player accordingly

// Only run the body of the statement if this is the frame the player landed
if (place_meeting(x, y + 1, o_collision_block) && !place_meeting(x, yprevious + 1, o_collision_block)) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects,a_player_land,false,7);	
	
	// Squash and stretch the player's sprite
	scale_x = 1.6;	// Wider
	scale_y = 0.4;	// Flatter
}

// Return the player's sprite to normal size
scale_x = approach(scale_x, 1, 0.08); // 1 == normal sprite size
scale_y = approach(scale_y, 1, 0.08); // 1 == normal sprite size
#endregion

#region // Change player sprites, based on actions taken

// Change the player's facing direction based on input
if (hsp_d != 0) { // Only change facing direction if player is moving
	// The facing variable will be applied to the image_xscale
	facing = sign(hsp_d); // sign() ensures facing will always return a whole number (-1, 0, 1)
}

// Check if the player has dashed
if (dash_delay > 0 ) {
	sprite_state = SPRITE.dash;
// The player has not dashed
} else {
	// If no movement is detected, move to the idle state
	if (vsp_d == 0 && hsp_d == 0 && (player_on_ground || player_on_jt && !player_inside_jt)) {
		sprite_state = SPRITE.idle;
	// Movement detected
	} else {
		// Check if the player is on the ground and running
		if (player_on_ground || player_on_jt && !player_inside_jt) {
			if (h_input_dir != 0) {
				image_speed = 1;			// Set the image speed
				sprite_state = SPRITE.run;  // Move to the run state
				sound_fx_run_timer -= 1;	// Decrement the timer for the run sound effect
				
				// If the run sound effect timer is at or below 0, play the sound again
				if (sound_fx_run_timer <= 0) {
					// Play a sound effect
					audio_play_sound_on(emitter_sound_effects, a_player_run, false, 4);	
					sound_fx_run_timer = sound_fx_run_max_timer;
				}
			// Move to the idle state
			} else {
				sprite_state = SPRITE.idle;	
			}
		// The player is in the air
		} else {
			// The player is on a wall
			if (player_on_wall != 0 && h_input_dir != 0 && h_input_dir == player_on_wall) {
				// The player is moving up, eg., such as jumping
				if (vsp_d < 0) {
					sprite_state = SPRITE.jump; // TO-DO: add a wall run or something similar?
				// The player is falling against a wall
				} else {
					sprite_state = SPRITE.wall_slide;
					facing = -player_on_wall;
				}
			// The player is not against a wall -- normal jumping and falling
			} else {
				// The player is moving up, eg., such as jumping
				if (vsp_d < 0) {
					sprite_state = SPRITE.jump;
				// The player is falling normally
				} else {
					sprite_state = SPRITE.fall;
				}
			}
		}
	}
}
#endregion

#region // Wall slide and running particle spawners
// Wall slide
if (player_on_wall != 0 && !player_on_ground && h_input_dir != 0 && vsp_d > 0) {
	// Decrement the wall slide timer
	effect_wall_slide_timer -= 1;
	
	// If the wall slide time is at or below 0, create a particle effect and reset the timer
	if (effect_wall_slide_timer <= 0 ) {
		instance_create_layer(x - (10 * facing), y - 5, "player", o_effect_player_wall_slide)	
		effect_wall_slide_timer = effect_wall_slide_max_timer;
	}
}
// Running
if (player_on_ground && hsp_d != 0) {
	// Decrement the run timer
	effect_run_timer -= 1;
	
	// If the run timer is at or below 0, create a particle effect and reset the timer
	if (effect_run_timer <= 0 ) {
		instance_create_layer(x - (10 * facing), y - 5, "player", o_effect_player_run)	
		effect_run_timer = effect_run_max_timer;
	}
}
#endregion

#region // Player death
// Spike death
if (place_meeting(x, y, o_spike)) {
	player_death	= 1; // The player is dead
	screenshake		= 1; // Activate screenshake
	instance_create_layer(x, y, "player", o_effect_death_burst); // Create a death effect
}

// Check if the player is outside of the room bounds
if (outside_room(o_player,40)) { // Run script to check the player's position
	player_death	= 1; // The player is dead
	screenshake		= 1; // Activate screenshake	
}

// Destroy the player if the player is dead so that we can recreate the player in the 'player_start_location' object
if (player_death) {
	// Play a sound effect and destroy the player object and their light source
	audio_play_sound_on(emitter_sound_effects, a_death, false, 7);
	if (instance_exists(o_aura_character_light)) instance_destroy(o_aura_character_light.id);
	instance_destroy();	
}	
#endregion

#region // Player charge up

// Check if the player is holding down the charge key/button
if (k_charge_pressed) {
	// If we're not at the maximum charge time yet, increment
	if (charge_time < max_charge_time) charge_time += 0.5;
	
	// If we're not at the maximum particle speed yet, increment
	if (particle_speed < max_particle_speed) particle_speed += 0.08;
	
	// Set the flash alarm
	if (alarm[11] <= 0 && flash <= 0) {
		alarm[11] = min(particle_speed * room_speed, max(0.08 * room_speed - particle_speed, 2));
	}
	
	// Select a random spot in a circle around the player to spawn the particle at
	var _dir = random(360);
	
	// Set the distance from the player that the particle should spawn at
	var _dist = 40;
	
	// Using the direction and distance found above, determine the x and y coordinates of the spawn location
	var _x = x + lengthdir_x(_dist, _dir);
	var _y = (y - 10) + lengthdir_y(_dist, _dir);
	
	// Set the direction the particle should travel towards the player
	var _part_dir = point_direction(_x, _y, x, y);
	part_type_direction(charge_particle, _part_dir, _part_dir, 0, 0);
	
	// Update new particles size and lifespan
	part_type_size(charge_particle, 0.8 + random(1.2), 0.8 + random(1.2), 0, 1);
	part_type_life(charge_particle, 4, 6 - (charge_time / 6));
	
	// Update newly created particles with the new speed, determined by how long the player has been charging up
	part_type_speed(charge_particle, particle_speed, particle_speed, 0, 0);
	
	// Create the particle
	part_particles_create(part_system, _x, _y, charge_particle, 1);
}

// Check if the player has released the charge key/button
if (k_charge_released) {
	// Reset the radius so player's can't maintain maximum size on minimum charge time
	if (radius > minimum_radius) radius = minimum_radius;
	
	// Add the time spent charging to the size of the radius, and the increase the size of the player's light	
	if (radius < maximum_radius) radius += charge_time;
	Aura_Light_Set_Radius(o_aura_character_light, radius, true);
	
	// Select a size for the ring effect based on the light radius -- supports three sizes (0 = small, 1 = medium, 2 = large)
	var _circle_effect_radius;
	if (radius <= 96) {						   // Less than or equal to 1/3 of the maximum radius
		_circle_effect_radius = 0;			   // Small
	} else if (radius > 96 && radius <= 192) { // Less than 2/3 of the maximum radius, but more than 1/3
		_circle_effect_radius = 1;			   // Medium
	} else {								   // More than 2/3 of the maximum radius
		_circle_effect_radius = 2;			   // Large
	}
	
	// Create the expanding ring effect centered on the player
	effect_create_above(ef_ring, x, y - 10, _circle_effect_radius, c_white);
	
	// Reset the charge timer and particle speed
	charge_time = 0;
	particle_speed = 1;
	
	// Set the fade alarm
	alarm[10] = 60;
}
#endregion

