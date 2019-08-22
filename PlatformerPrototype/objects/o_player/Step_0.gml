/// @description Move player based on input and collisions

// If the game is paused, don't run any of the code below this
if (pause) exit;

if (keyboard_check_pressed(ord("B"))) {
	part_type_colour1(body_part_, c_black);
	part_type_colour1(jump_part_, c_black);
	part_type_colour1(wall_part_, c_black);
}

#region // Dash and jump buffer timer
// Disable input after dash and wall jump with delay timers
wall_jump_delay_	= max(wall_jump_delay_ - 1, 0);
dash_delay_		= max(dash_delay_ - 1, 0);
#endregion

#region // Reset jump and dash when touching ground
// Check if the player is on the ground or on a jump-through platform, but *not* inside a jump-through
if (player_on_ground_ || player_on_jt_ && !player_inside_jt_) { 
	player_jumped_	= 0;	// Reset jump
	jump_off_timer_	= jump_off_max_timer_; // Reset jump buffer -- number of frames the player has to still jump afer falling of a ledge
	player_dashed_  = 0;		// Reset dash
} else {
	// Jump delay buffer timer
	jump_off_timer_ -= 1;
}
#endregion

#region // Dash
// Get the direction of the dash
dash_direction_ = point_direction(0, 0, h_input_dir_, v_input_dir_);

// Check if the dash key pressed and the player hasn't already dashed
if (k_dash && !player_dashed_) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_dash, false, 7);
	
	// Dash flag and timer
	player_dashed_ = true; // player has dashed
	dash_delay_	  = dash_delay_max_;
	
	// Ensure we have a direction to dash in, else we will simply dash in the direction the player is facing
	if (dash_direction_ != 0) {
		hspd_ = lengthdir_x(dash_length_, dash_direction_);
		vspd_ = lengthdir_y(dash_length_, dash_direction_);
	} else {
		hspd_ = lengthdir_x(dash_length_ * facing_, dash_direction_);
		vspd_ = lengthdir_y(dash_length_, dash_direction_);
	}
	
	// Reset fractions
	hspd_frac_ = 0;
	vspd_frac_ = 0;
}
#endregion

#region // Wall Jump

// If the player is on a wall and in the air, and the jump key is pressed, move the player
if (player_on_wall_ != 0) && (!player_on_ground_) && (k_jump_pressed) && (!player_on_jt_ || player_inside_jt_) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_jump, false, 7);
	
	// Jump flag and timer
	player_jumped_ = true;	// Set jump flag
	wall_jump_delay_ = wall_jump_delay_max_;	// Reset wall jump delay timer -- for no key input
	
	// Update the player's speed with jump variables
	hspd_ = -player_on_wall_ * hspd_wall_jump_length_;	// Apply jump height to hsp_eed
	vspd_ = vspd_wall_jump_height_;					// Apply jump distance to vsp_eed
	
	// Reset fractions
	hspd_frac_	= 0;
	vspd_frac_	= 0;

	// Create particle effects when jumping
	part_particles_create(part_sys_, x, y, jump_part_, 15);
} else {
	// Lower jump height when the jump key/button is released before the maximum jump height was reached.
	if ((k_jump_released) && (!player_on_ground_) && (!player_jumped_) && (vspd_ < 0)) {
		vspd_ *= 0.25; 
	}
}
#endregion

#region // Normal jump
if (k_jump_pressed) && (!player_jumped_) && (jump_off_timer_ > 0) && (!player_down_check) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_jump, false, 7);	
	
	// Jump height
	vspd_	  = vspd_jump_;
	vspd_frac_ = 0; // Reset fraction
	
	// Jump flag
	player_jumped_ = true; // The player has jumped
	
	// Create a particle effect when jumping
	part_particles_create(part_sys_, x, y, jump_part_, 15);
} else {
	// Lower jump height when the jump key/button is released before the maximum jump height was reached.
	if (k_jump_released) && (vspd_ < 0) {
		vspd_ *= 0.25;
	}
}
#endregion

#region // Limit hspeed and vspeed velocities based on what the player is doing
/* Change vspd_ max velocity based on whether the player is going up or down.
   Since jumping is usually a higher velocity than falling we dont want the player restricted to the same rules as falling. */

// Going down, falling normally
if (vspd_ > 0 ) {
	vspd_dir_vel_ = vspd_max_fall_speed_;
// Going up, typically change for jumping speed
} else {
	vspd_dir_vel_ = vspd_max_jump_;
}

// If the player has dashed, change limits of speed to dash speed.
if (dash_delay_ > 0 ) {
	final_max_hspd_ = hspd_max_dash_;
	final_max_vspd_ = vspd_max_dash_;
	final_acc	   = 0;
	final_fric	   = 0;
	final_grav_	   = grav_dash;
// If player has not dashed, use normal max velocities.
} else {
	// The player is on the ground
	if (player_on_ground_ || player_on_jt_ && !player_inside_jt_) {
		final_max_hspd_ = hspd_max_ground_;
		final_max_vspd_ = vspd_dir_vel_;
		// The player is on ice
		if (player_on_ice) {
			final_acc  = hspd_acc_ice;
			final_fric = hspd_fric_ice;
		// The player is not on the ice
		} else {
			final_acc  = hspd_acc_ground;
			final_fric = hspd_fric_ground;	
		}
		final_grav_		= 0;
	// The player is not on the ground
	} else {
		final_max_hspd_ = hspd_max_air_;
		final_max_vspd_ = vspd_dir_vel_;
		final_acc	   = hspd_acc_air;
		final_fric	   = hspd_fric_air;
		final_grav_	   = grav_air;
		
		// If the player is on a wall, redefine max speeds //
		
		// Check if the player is wall jumping
		if (wall_jump_delay_ > 0 ) {
			final_grav_ = grav_air;
		// The player is not wall jumping
		} else {
			// Check if the player is on a wall and has pressed a key against it
			if ((player_on_wall_ != 0) && (h_input_dir_ != 0) && (h_input_dir_ == player_on_wall_)) {
				// Check if the player is going up against a wall
				if vspd_ < 0 {
					final_max_vspd_  = vspd_max_wall_slide_spd_ ;
					final_grav_		= grav_air;
				// Check if the player is going down against a wall
				} else {
					final_max_vspd_  = vspd_max_wall_slide_spd_ ;
					final_grav_		= grav_wall;
				}
			// Have the player fall normally next to a wall -- set normal grav_ity since the player is not pushing up against the wall
			} else {
				final_max_vspd_ = vspd_dir_vel_;
				final_grav_	   = grav_air;
			}
		}
	}	
}
#endregion

#region // Apply forces(gravity, acceleration, friction) to hspeed and vspeed
// Apply final friction, acceleration and gravity to player, and move the player based on input //

// Disable input if player has wall jumped
if (wall_jump_delay_ <= 0) {
	hspd_ += (h_input_dir_ * final_acc); // Only move the player horizontally if they haven't wall jumped
}

// Apply gravity to the player
vspd_ += final_grav_;

// Apply friction to the player if no input is detected
if (h_input_dir_ == 0) {
	hspd_ = approach(hspd_, 0, final_fric);
}
#endregion

#region // Dump fractions
/* Fractions are used to have pixel perfect collisions and movement --
   Only dump fractions if the player's initial velocity has exceeded one (1) */

// Add the fraction values to hspd_ and vspd_
hspd_ += hspd_frac_;
vspd_ += vspd_frac_;

// Get the fraction value from hspd_
if (hspd_ >= 1 || hspd_ <= -1) hspd_frac_ = frac(hspd_);
//hspd_frac_ = frac(hspd_); // Substitute this line for the one above to remove the player's initial velocity

// Get the fraction value from vspd_
vspd_frac_ = frac(vspd_);

// Subtract the fraction from the original number, making it a whole number
hspd_ -= hspd_frac_;
vspd_ -= vspd_frac_;
#endregion

#region // Check for collisions
// Horizontal collision check
if (place_meeting(x + hspd_, y, o_collision_block)) {
	// Get the direction the player is moving in ( 1 for right, -1 for left, 0 for no horizontal movement)
	var one_pixelx = sign(hspd_);
	
	// Move the player in their current direction as long as they aren't colliding with a block
	while (!place_meeting(x + one_pixelx, y, o_collision_block)) {
		x += one_pixelx;	
	}
	
	// Set hspd_ variables to 0 once we're colliding with a block
	hspd_	  = 0;
	hspd_frac_ = 0;
}

// Vertical collision check
if (place_meeting(x, y + vspd_, o_collision_block)) {
	// Get the direction the player is moving in ( 1 for down, -1 for up, 0 for no vertical movement)
	var one_pixely = sign(vspd_);
	
	// Move the player in their current direction as long as they aren't colliding with a block
	while (!place_meeting(x,y+one_pixely,o_collision_block)) {
		y += one_pixely;	
	}
	
	// Set vspd_ variables to 0 once we're colliding with a block
	vspd_	  = 0;
	vspd_frac_ = 0;
}
// Platform collisions
// Checks if the player is moving down and colliding with a platform, but currently not inside it
if ((vspd_ > 0 && place_meeting(x, y + vspd_, o_jump_through_wood)) && (!place_meeting(x, y, o_jump_through_wood))) {
	// Get the direction the player is moving in ( 1 for down, -1 for up, 0 for no vertical movement)
	var one_pixely = sign(vspd_);
	
	// Move the player in their current direction as long as they aren't colliding with a platform
	while (!place_meeting(x, y + one_pixely, o_jump_through_wood)) {
		y += one_pixely;	
	}
	
	// Set vspd_ variables to 0 once we're colliding with a platform
	vspd_	  = 0;
	vspd_frac_ = 0;
}
#endregion

#region // Jump down platforms
// Fall down through a platform
if (player_down_check && k_jump_pressed && player_on_jt_ && !player_inside_jt_ && !player_on_ground_) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects, a_jump, false, 7);	
	y++;
}
#endregion

#region // Clamp speeds and move player object
// Clamp the maximum speeds the player can move at
hspd_ = clamp(hspd_, -final_max_hspd_, final_max_hspd_);
vspd_ = clamp(vspd_, -final_max_vspd_, final_max_vspd_);

// Move the player's x and y position
x += hspd_;
y += vspd_;
#endregion

#region // Check for landing, then play a sound effect
// Only run the body of the statement if this is the frame the player landed
if (place_meeting(x, y + 1, o_collision_block) && !place_meeting(x, yprevious + 1, o_collision_block)) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects,a_player_land,false,7);	
}
#endregion

#region // Change player sprites, based on actions taken

// Change the player's facing direction based on input
if (h_input_dir_ != 0) { // Only change facing direction if player is moving
	// The facing variable will be applied to the image_xscale
	facing_ = sign(h_input_dir_); // sign() ensures facing will always return a whole number (-1, 0, 1)
}

// Check if the player has dashed
//if (dash_delay_ > 0 ) {

//// The player has not dashed
//} else {
//	// If no movement is detected, move to the idle state
//	if (vspd_ == 0 && hspd_ == 0 && (player_on_ground_ || player_on_jt_ && !player_inside_jt_)) {
//		//sprite_state = SPRITE.idle;
//	// Movement detected
//	} else {
//		// Check if the player is on the ground and running
//		if (player_on_ground_ || player_on_jt_ && !player_inside_jt_) {
//			if (h_input_dir_ != 0) {
//				image_speed = 1;			// Set the image speed
//				//sprite_state = SPRITE.run;  // Move to the run state
//				sound_fx_run_timer_ -= 1;	// Decrement the timer for the run sound effect
				
//				// If the run sound effect timer is at or below 0, play the sound again
//				if (sound_fx_run_timer_ <= 0) {
//					// Play a sound effect
//					//audio_play_sound_on(emitter_sound_effects, a_player_run, false, 4);	
//					sound_fx_run_timer_ = sound_fx_run_max_timer_;
//				}
//			// Move to the idle state
//			} else {
//				image_speed = 0.25;
//				//sprite_state = SPRITE.idle;	
//			}
//		// The player is in the air
//		} else {
//			// The player is on a wall
//			if (player_on_wall_ != 0 && h_input_dir_ != 0 && h_input_dir_ == player_on_wall_) {
//				// The player is moving up, eg., such as jumping
//				if (vspd_ < 0) {
//					//sprite_state = SPRITE.jump; // TO-DO: add a wall run or something similar?
//				// The player is falling against a wall
//				} else {
//					//sprite_state = SPRITE.wall_slide;
//					facing = -player_on_wall_;
//				}
//			// The player is not against a wall -- normal jumping and falling
//			} else {
//				// The player is moving up, eg., such as jumping
//				if (vspd_ < 0) {
//					//sprite_state = SPRITE.jump;
//				// The player is falling normally
//				} else {
//					//sprite_state = SPRITE.fall;
//				}
//			}
//		}
//	}
//}
#endregion

 #region // Wall slide and running particle spawners
// Wall slide
if (player_on_wall_ != 0 && !player_on_ground_ && h_input_dir_ != 0 && vspd_ > 0) {
	// Decrement the wall slide timer
	effect_wall_slide_timer_ -= 1;
	
	// If the wall slide time is at or below 0, create a particle effect and reset the timer
	if (effect_wall_slide_timer_ <= 0 ) {
		part_particles_create(part_sys_, x, y, jump_part_, 5);
		effect_wall_slide_timer_ = effect_wall_slide_max_timer_;
	}
}
// Running
if (player_on_ground_ && hspd_ != 0) {
	// Decrement the run timer
	effect_run_timer_ -= 1;
	
	// If the run timer is at or below 0, create a particle effect and reset the timer
	if (effect_run_timer_ <= 0 ) {
		part_particles_create(part_sys_, x - (5 * facing_), y - (sprite_height / 2), jump_part_, 1);
		effect_run_timer_ = effect_run_max_timer_;
	}
}
#endregion

#region // Player death
// Spike death
if (place_meeting(x, y, o_spike)) {
	player_death = 1; // The player is dead
	screenshake	 = 1; // Activate screenshake
	instance_create_layer(x, y, "player", o_effect_death_burst); // Create a death effect
}

// Check if the player is outside of the room bounds
//if (outside_room(o_player, 40)) { // Run script to check the player's position
//	player_death = 1; // The player is dead
//	screenshake	 = 1; // Activate screenshake	
//}

// Destroy the player if the player is dead so that we can recreate the player in the 'player_start_location' object
if (player_death) {
	// Play a sound effect and destroy the player object and their light source
	audio_play_sound_on(emitter_sound_effects, a_death, false, 7);
	if (instance_exists(o_aura_character_light)) instance_destroy(o_aura_character_light.id);
	if (instance_exists(o_camera)) o_camera.camera_target_ = noone;
	instance_destroy();	
}	
#endregion

#region // Player light
// Check if the player is holding down the charge key/button
if (k_charge_pressed) {
	if (effect_shine_timer_ > minimum_radius_) {
		if (hspd_ != 0 || !player_on_ground_) {
			// Slow down the reduction of the light radius_
			effect_shine_timer_--;
		}
	}
	radius_ = effect_shine_timer_;
}
// Check if the player has released the charge key/button 
if (k_charge_released) {
	// Reset the light radius_ to the minimum size
	radius_ = minimum_radius_;
	
	// Set the recharge control alarm
	alarm[9] = room_speed / 2;
}
#endregion

#region // Light projectile
// Check if the player has pressed the button for action 1
if (k_action_1) {
	// Make sure the player has enough "light energy" to create a projectile
	if (!instance_exists(o_aura_light_projectile)) {
		// Create the projectile if one doesn't already exist
		if (effect_shine_timer_ >= 96) {
			// Create the projectile and set the speed based on input direction
			var _light  = instance_create_layer(x, y - sprite_height / 2, "player", o_aura_light_projectile)
			if (k_up) { 
				_light.vspd_ = -4;
			} else if (k_down) {
				_light.vspd_ = 4;
			} else {
				_light.hspd_ = 4 * facing_;
			}
	
			// Drain some of the player's light gauge
			effect_shine_timer_ -= 32;
		
			// Set the recharge control alarm
			alarm[9] = room_speed / 2;
		}
	// Decide how to handle an already existing projectile
	} else {			
		// Grab the existing projectile
		var _light = instance_nearest(x, y, o_aura_light_projectile);
						
		// Check if it's already been triggered (i.e., detonated or collided with a wall)
		if (_light != noone) {
			if (_light.triggered_) {
				// If it has, destroy it and create a new one
				instance_destroy(_light);
				
				// Make sure the player has enough "light energy" to create a projectile
				if (effect_shine_timer_ >= 96) {
					// Create the projectile and set the speed based on input direction
					var _light  = instance_create_layer(x, y - sprite_height / 2, "player", o_aura_light_projectile)
					if (k_up) { 
						_light.vspd_ = -4;
					} else if (k_down) {
						_light.vspd_ = 4;
					} else {
						_light.hspd_ = 4 * facing_;
					};
	
					// Drain some of the player's light gauge
					effect_shine_timer_ -= 32;
					
					// Set the recharge control alarm
					alarm[9] = room_speed / 2;
				}
			
			// If it hasn't been triggered yet, detonate it
			} else {
				// Set the collision flags in order to trigger it
				_light.h_collision_ = true;
				_light.v_collision_ = true;
			}
		}		
	}
}
#endregion

#region // Particle system body

part_emitter_region(part_sys_, body_emitter_, x, x, y-sprite_height / 2, y, ps_shape_diamond, ps_distr_gaussian);

#endregion

#region // Check for hidden tiles
//var _layer_id = layer_get_id("hidden_tiles");
var _hidden_tiles = tilemap_get_at_pixel(map_fake[0], x, y)

var _alpha = 1;
if (_hidden_tiles > 0) _alpha = 0.5;
hidden_tile_alpha = lerp(hidden_tile_alpha, _alpha, 0.1);
#endregion