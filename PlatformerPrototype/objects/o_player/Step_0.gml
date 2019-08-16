/// @description Move player based on input and collisions

// If the game is paused, don't run any of the code below this
if (pause) exit;

if (keyboard_check_pressed(ord("B"))) {
	part_type_colour1(body_part, c_black);
	part_type_colour1(jump_part, c_black);
	//part_type_colour1(ground_up_part, c_black);
	//part_type_colour1(ground_left_part, c_black);
	//part_type_colour1(ground_right_part, c_black);
}

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
if (k_dash && !player_dashed) && (!k_charge_pressed) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_dash, false, 7);
	
	// Squash and stretch
	scale_x = 0.4;
	scale_y = 0.5;
	
	// Dash flag and timer
	player_dashed = true; // player has dashed
	dash_delay	  = dash_delay_max;
	
	// Ensure we have a direction to dash in, else we will simply dash in the direction the player is facing
	if (dash_direction != 0) {
		hspd = lengthdir_x(dash_length, dash_direction);
		vspd = lengthdir_y(dash_length, dash_direction);
	} else {
		hspd = lengthdir_x(dash_length * facing, dash_direction);
		vspd = lengthdir_y(dash_length, dash_direction);
	}
	
	// Reset fractions
	hspd_frac = 0;
	vspd_frac = 0;
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
	hspd = -player_on_wall * hspd_wall_jump_length;	// Apply jump height to hsp_eed
	vspd = vspd_wall_jump_height;					// Apply jump distance to vsp_eed
	
	// Squash and stretch
	scale_x = 0.5;
	scale_y = 1.4;
	
	// Reset fractions
	hspd_frac	= 0;
	vspd_frac	= 0;

	// Create particle effects when jumping
	//if !instance_exists(o_effect_jump_burst) instance_create_layer(x, y, "player", o_effect_jump_burst);
	part_particles_create(part_sys, x, y, jump_part, 15);
} else {
	// Lower jump height when the jump key/button is released before the maximum jump height was reached.
	if ((k_jump_released) && (!player_on_ground) && (!player_jumped) && (vspd < 0)) {
		vspd *= 0.25; 
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
	vspd	  = vspd_jump;
	vspd_frac = 0; // Reset fraction
	
	// Jump flag
	player_jumped = true; // The player has jumped
	
	// Create a particle effect when jumping
	//if (!instance_exists(o_effect_jump_burst)) instance_create_layer(x, y, "player", o_effect_jump_burst);
	part_particles_create(part_sys, x, y, jump_part, 15);
} else {
	// Lower jump height when the jump key/button is released before the maximum jump height was reached.
	if (k_jump_released) && (vspd < 0) {
		vspd *= 0.25;
	}
}
#endregion

#region // Limit hspeed and vspeed velocities based on what the player is doing
/* Change vspd max velocity based on whether the player is going up or down.
   Since jumping is usually a higher velocity than falling we dont want the player restricted to the same rules as falling. */

// Going down, falling normally
if (vspd > 0 ) {
	vspd_dir_vel = vspd_max_fall_speed;
// Going up, typically change for jumping speed
} else {
	vspd_dir_vel = vspd_max_jump;
}

// If the player has dashed, change limits of speed to dash speed.
if (dash_delay > 0 ) {
	final_max_hspd = hspd_max_dash;
	final_max_vspd = vspd_max_dash;
	final_acc	= 0;
	final_fric	= 0;
	final_grav_  = grav_dash;
// If player has not dashed, use normal max velocities.
} else {
	// The player is on the ground
	if (player_on_ground || player_on_jt && !player_inside_jt) {
		final_max_hspd	= hspd_max_ground;
		final_max_vspd	= vspd_dir_vel;
		// The player is on ice
		if (player_on_ice) {
			final_acc		= hspd_acc_ice;
			final_fric		= hspd_fric_ice;
		// The player is not on the ice
		} else {
			final_acc		= hspd_acc_ground;
			final_fric		= hspd_fric_ground;	
		}
		final_grav_		= 0;
	// The player is not on the ground
	} else {
		final_max_hspd	= hspd_max_air;
		final_max_vspd	= vspd_dir_vel;
		final_acc		= hspd_acc_air;
		final_fric		= hspd_fric_air;
		final_grav_		= grav_air;
		
		// If the player is on a wall, redefine max speeds //
		
		// Check if the player is wall jumping
		if (wall_jump_delay > 0 ) {
			final_grav_ = grav_air;
		// The player is not wall jumping
		} else {
			// Check if the player is on a wall and has pressed a key against it
			if ((player_on_wall != 0) && (h_input_dir != 0) && (h_input_dir == player_on_wall)) {
				// Check if the player is going up against a wall
				if vspd < 0 {
					final_max_vspd  = vspd_max_wall_slide_spd ;
					final_grav_	= grav_air;
				// Check if the player is going down against a wall
				} else {
					final_max_vspd  = vspd_max_wall_slide_spd ;
					final_grav_	= grav_wall;
				}
			// Have the player fall normally next to a wall -- set normal grav_ity since the player is not pushing up against the wall
			} else {
				final_max_vspd	= vspd_dir_vel;
				final_grav_		= grav_air;
			}
		}
	}	
}
#endregion

#region // Apply forces(gravity, acceleration, friction) to hspeed and vspeed
// Apply final friction, acceleration and gravity to player, and move the player based on input //

// Disable input if player has wall jumped
if (wall_jump_delay <= 0) {
	hspd += (h_input_dir * final_acc); // Only move the player horizontally if they haven't wall jumped
}

// Apply grav_ity to the player
vspd += final_grav_;

// Apply friction to the player if no input is detected
if (h_input_dir == 0) {
	hspd = approach(hspd, 0, final_fric);
}
#endregion

#region // Dump fractions
/* Fractions are used to have pixel perfect collisions and movement --
   Only dump fractions if the player's initial velocity has exceeded one (1) */

// Add the fraction values to hspd and vspd
hspd += hspd_frac;
vspd += vspd_frac;

// Get the fraction value from hspd
if (hspd >= 1 || hspd <= -1) hspd_frac = frac(hspd);
//hspd_frac = frac(hspd); // Substitute this line for the one above to remove the player's initial velocity

// Get the fraction value from vspd
vspd_frac = frac(vspd);

// Subtract the fraction from the original number, making it a whole number
hspd -= hspd_frac;
vspd -= vspd_frac;
#endregion

#region // Check for collisions
// Horizontal collision check
if (place_meeting(x + hspd, y, o_collision_block)) {
	// Get the direction the player is moving in ( 1 for right, -1 for left, 0 for no horizontal movement)
	var one_pixelx = sign(hspd);
	
	// Move the player in their current direction as long as they aren't colliding with a block
	while (!place_meeting(x + one_pixelx, y, o_collision_block)) {
		x += one_pixelx;	
	}
	
	// Set hspd variables to 0 once we're colliding with a block
	hspd		= 0;
	hspd_frac	= 0;
}

// Vertical collision check
if (place_meeting(x, y + vspd, o_collision_block)) {
	// Get the direction the player is moving in ( 1 for down, -1 for up, 0 for no vertical movement)
	var one_pixely = sign(vspd);
	
	// Move the player in their current direction as long as they aren't colliding with a block
	while (!place_meeting(x,y+one_pixely,o_collision_block)) {
		y += one_pixely;	
	}
	
	// Set vspd variables to 0 once we're colliding with a block
	vspd		= 0;
	vspd_frac	= 0;
}
// Platform collisions
// Checks if the player is moving down and colliding with a platform, but currently not inside it
if ((vspd > 0 && place_meeting(x, y + vspd, o_jump_through_wood)) && (!place_meeting(x, y, o_jump_through_wood))) {
	// Get the direction the player is moving in ( 1 for down, -1 for up, 0 for no vertical movement)
	var one_pixely = sign(vspd);
	
	// Move the player in their current direction as long as they aren't colliding with a platform
	while (!place_meeting(x, y + one_pixely, o_jump_through_wood)) {
		y += one_pixely;	
	}
	
	// Set vspd variables to 0 once we're colliding with a platform
	vspd		= 0;
	vspd_frac	= 0;
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
hspd = clamp(hspd, -final_max_hspd, final_max_hspd);
vspd = clamp(vspd, -final_max_vspd, final_max_vspd);

// Move the player's x and y position
x += hspd;
y += vspd;
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
if (hspd != 0) { // Only change facing direction if player is moving
	// The facing variable will be applied to the image_xscale
	facing = sign(hspd); // sign() ensures facing will always return a whole number (-1, 0, 1)
}

// Check if the player has dashed
if (dash_delay > 0 ) {
	//sprite_state = SPRITE.dash;
// The player has not dashed
} else {
	// If no movement is detected, move to the idle state
	if (vspd == 0 && hspd == 0 && (player_on_ground || player_on_jt && !player_inside_jt)) {
		//sprite_state = SPRITE.idle;
	// Movement detected
	} else {
		// Check if the player is on the ground and running
		if (player_on_ground || player_on_jt && !player_inside_jt) {
			if (h_input_dir != 0) {
				image_speed = 1;			// Set the image speed
				//sprite_state = SPRITE.run;  // Move to the run state
				sound_fx_run_timer -= 1;	// Decrement the timer for the run sound effect
				
				// If the run sound effect timer is at or below 0, play the sound again
				if (sound_fx_run_timer <= 0) {
					// Play a sound effect
					//audio_play_sound_on(emitter_sound_effects, a_player_run, false, 4);	
					sound_fx_run_timer = sound_fx_run_max_timer;
				}
			// Move to the idle state
			} else {
				image_speed = 0.25;
				//sprite_state = SPRITE.idle;	
			}
		// The player is in the air
		} else {
			// The player is on a wall
			if (player_on_wall != 0 && h_input_dir != 0 && h_input_dir == player_on_wall) {
				// The player is moving up, eg., such as jumping
				if (vspd < 0) {
					//sprite_state = SPRITE.jump; // TO-DO: add a wall run or something similar?
				// The player is falling against a wall
				} else {
					//sprite_state = SPRITE.wall_slide;
					facing = -player_on_wall;
				}
			// The player is not against a wall -- normal jumping and falling
			} else {
				// The player is moving up, eg., such as jumping
				if (vspd < 0) {
					//sprite_state = SPRITE.jump;
				// The player is falling normally
				} else {
					//sprite_state = SPRITE.fall;
				}
			}
		}
	}
}
#endregion

 #region // Wall slide and running particle spawners
// Wall slide
if (player_on_wall != 0 && !player_on_ground && h_input_dir != 0 && vspd > 0) {
	// Decrement the wall slide timer
	effect_wall_slide_timer -= 1;
	
	// If the wall slide time is at or below 0, create a particle effect and reset the timer
	if (effect_wall_slide_timer <= 0 ) {
		//instance_create_layer(x - (10 * facing), y - 5, "player", o_effect_player_wall_slide);
		part_particles_create(part_sys, x, y, jump_part, 5);
		effect_wall_slide_timer = effect_wall_slide_max_timer;
	}
}
// Running
if (player_on_ground && hspd != 0) {
	// Decrement the run timer
	effect_run_timer -= 1;
	
	// If the run timer is at or below 0, create a particle effect and reset the timer
	if (effect_run_timer <= 0 ) {
		//instance_create_layer(x - (10 * facing), y - 5, "player", o_effect_player_run);
		//part_particles_create(part_sys, x, y, jump_part, 5);
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
	if (instance_exists(o_camera)) o_camera.camera_target_ = noone;
	instance_destroy();	
}	
#endregion

#region // Player charge up
// Check if the player is holding down the charge key/button
if (k_charge_pressed) {
	if (effect_shine_timer_ > minimum_radius) {
		// Slow down the reduction of the light radius
		if (irandom(100) mod 2 = 0) { effect_shine_timer_--; }
		radius = effect_shine_timer_;
	}
}
// Check if the player has released the charge key/button
if (k_charge_released) {
	alarm[9] = room_speed/2;
}
#endregion

#region // Particle system body

part_emitter_region(part_sys, body_emitter, x, x, y-sprite_height/2, y, ps_shape_diamond, ps_distr_gaussian);

#endregion

#region // Check for hidden tiles
//var _layer_id = layer_get_id("hidden_tiles");
var _hidden_tile = tilemap_get_at_pixel(map_fake[0], x, y)

var _alpha = 1;
if (_hidden_tile > 0) _alpha = 0.2;
hidden_tile_alpha = lerp(hidden_tile_alpha, _alpha, 0.1);
#endregion