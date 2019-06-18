/// @description Initialize player variables

// Tile shader test
grass_layer_id		   = layer_get_id("grass");
grass_objects_layer_id = layer_get_id("grass_objects");
enemy_layer_id		   = layer_get_id("enemy");
platform_layer_id	   = layer_get_id("jump_through");
spike_layer_id		   = layer_get_id("spike");
ice_layer_id		   = layer_get_id("ice");

#region // Player flashing

// Initialize a flash variable
flash = 0;

// Get the shader variable for flashing the player's sprite
flashShaderAlpha = shader_get_uniform(flash_sprite, "_alpha");

#endregion

#region // Charging particle

// Initialize the charging particle system
part_system = part_system_create();
part_system_depth(part_system, -100);

// Define the particle created while charging
charge_particle = part_type_create();
part_type_shape(charge_particle, pt_shape_pixel);
//part_type_size(charge_particle, 0.8 + random(1), 0.8 + random(1), 0, 0);
part_type_scale(charge_particle, 1, 1);
part_type_color2(charge_particle, 16777088, 16777215);
part_type_alpha2(charge_particle, 1, 0);
part_type_speed(charge_particle, 1, 1, 0, 0);
part_type_direction(charge_particle, 0, 359, 0, 0);
part_type_gravity(charge_particle, 0, 270);
part_type_orientation(charge_particle, 0, 0, 0, 0, 1);
part_type_blend(charge_particle, 1);
part_type_life(charge_particle, 10, 10);

// Particle charging variables
charge_time = 0;
max_charge_time = 256;

// Particle radius variables
minimum_radius = 32;
radius = minimum_radius;
maximum_radius = 288;

// Particle speed variables
particle_speed = 1;
max_particle_speed = 15;

#endregion

#region // Lighting

// Create the lighting around the player
instance_create_depth(x, y - 10, 300, o_aura_character_light)

#endregion

#region // Player variables

#region // Velocity and sub-pixel movement
// Velocity
hsp_d = 0; // horizontal movement speed variable.
vsp_d = 0; // vertical movement speed variable.

// Sub-pixel movement variables -- ensure the player will only move once their speed reaches a whole number
hsp_d_frac = 0;
vsp_d_frac = 0;
#endregion

#region // Acceleration, friction, and grav_ity
// Acceleration, friction and grav_ity
hsp_d_acc_ground		= 0.2;	// How fast the player accelerates when on the ground
hsp_d_acc_air		= 0.5;	// How fast the player accelerates when in the air
hsp_d_fric_ground	= 0.5;  // How fast the player will stop moving
hsp_d_fric_air		= 0.1;  // How fast the player will stop moving horizontally in the air
grav__air	= 0.2;	// grav_ity when the player is in the air
grav__wall	= 0.2;  // grav_ity when the player is on a wall -- this amounts to cling time on a wall as well before moving downward again
grav__dash	= 0;	// grav_ity when the player is dashing
final_acc	= 0;	// Changes depending on player position, eg. on wall, or ground
final_fric	= 0;	// Same principal as above
final_grav_	= 0;	// Same principal as above

// Ice acceleration and friction
hsp_d_acc_ice = 0.1;
hsp_d_fric_ice = 0.03;
#endregion

#region // Max hsp_eed velocity, jump variables, and max vsp_eed velocity
// Max hsp_eed velocity
hsp_d_max_ground = 3;	// Move slower on the ground
hsp_d_max_air	= 5;	// Move faster when in the air
final_max_hsp_d	= 0;	// Max hsp_eed velocity changes based on player position and key presses

// Jump variables
vsp_d_jump				= -6;	// Jump height
hsp_d_wall_jump_length	= 3;	// Distance of wall jump
vsp_d_wall_jump_height	= -5;	// Height of wall jump
player_jumped			= 0;	// Check if player has jumped. false
wall_jump_delay			= 0;	// Counter to stop player from any input after wall jumping
wall_jump_delay_max		= 13;	// 13 frames -- if delay is reached, player input is restored
jump_off_max_timer		= 10;	// 10 frame delay to jump after the player has dropped from a ledge
jump_off_timer			= jump_off_max_timer; // This is the jump-off timer to be used
vsp_d_max_jump			= abs(vsp_d_jump);	// Ensure this is positive by using abs()

// Max vsp_eed velocity
vsp_d_max_fall_speed		= 4;	// Maximum falling speed
vsp_d_max_wall_slide_spd = 1;	// Maximum speed the player will move when sliding down walls
final_max_vsp_d			= 0;	// Max vsp_eed velocity will change based on the player's position and key presses
vsp_d_dir_vel			= 0;	// Changes depending on the direction the player is moving -- up or down
#endregion

#region // Dash variables
// Dash variables
dash_length		= 8;	// Max distance of the dash
hsp_d_max_dash	= dash_length;	// Used to set the hsp_eed maximum velocity
vsp_d_max_dash	= dash_length;	// Used to set the vsp_eed maximum velocity
player_dashed	= 0;	// Check if the player has dashed -- initialized to false
dash_delay		= 0;	// Counter to stop the player from submitting any input after dashing
dash_delay_max  = 10;	// 10 frames to stop the player from having any input
dash_direction	= 0;	// Direction the player will dash in
#endregion

#region // Ground and wall checks
// Checks to see if player on ground or on a wall
player_on_ground		= false; // Check if the player is currently on the ground
player_on_wall_left		= false; // Check if the player is currently colliding with left wall
player_on_wall_right	= false; // Check if the player is currently colliding with right wall
player_on_wall			= false; // Check if the player is colliding with any wall
player_on_jt			= false; // Check if the player is on top of a jump through platform
player_inside_jt		= false; // Check if the player is inside of a jump through platform
#endregion

#region // facing
// Player facing direction
facing = 1; // 1 == right, -1 == left
#endregion

#region // Input check
// Input check -- mainly used for dash direction and horizontal movement direction
h_input_dir	= 0; // Check if left or right button is pressed
v_input_dir	= 0; // Check if up or down button is pressed
#endregion

#region // Squash and stretch
// Used to deform the player's sprite when jumping and landing
scale_x	= 1;
scale_y = 1;
#endregion

#region // Timers
// Player effects timers
effect_wall_slide_max_timer = 5; // Create a new particle every 5 frames, if player is sliding down a wall
effect_wall_slide_timer		= effect_wall_slide_max_timer; 
effect_run_max_timer		= 5; // Create a new particle every 5 frames, if player is running on the ground
effect_run_timer			= effect_run_max_timer; 

// Sound effect timers
sound_fx_run_max_timer = 15; // The number of frames before the run sound is played
sound_fx_run_timer	   = sound_fx_run_max_timer;
#endregion

#region // Player sprite control
// Sprite state lookup table
enum SPRITE {
	idle,
	run,
	jump,
	fall,
	wall_slide,
	dash
}
// Initial sprite state
sprite_state = SPRITE.idle;	

// Sprite array table -- assign different sprites to an array position
sprite_array[SPRITE.idle]		= s_player_idle;
sprite_array[SPRITE.run]		= s_player_run;
sprite_array[SPRITE.jump]		= s_player_jump;
sprite_array[SPRITE.fall]		= s_player_falling;
sprite_array[SPRITE.wall_slide]	= s_player_wall_slide;
sprite_array[SPRITE.dash]		= s_player_jump;
#endregion

#endregion


