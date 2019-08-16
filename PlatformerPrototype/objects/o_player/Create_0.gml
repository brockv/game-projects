/// @description Initialize player variables

#region // Player particle system
color_ = c_white;
part_sys = part_system_create();
part_system_draw_order(part_sys, true);
body_emitter = part_emitter_create(part_sys);

body_part = part_type_create();
part_type_shape(body_part, pt_shape_sphere);
part_type_size(body_part, 0.2, 0.5, -0.05, 0);
part_type_speed(body_part, 0, 0.01, 0, 0);
part_type_direction(body_part, 0, 360, 0, 10);
part_type_color1(body_part, color_);
part_type_life(body_part, room_speed/2, room_speed);
part_emitter_stream(part_sys, body_emitter, body_part, 10);

jump_part = part_type_create();
part_type_shape(jump_part, pt_shape_sphere);
part_type_size(jump_part, 0.2, 0.8, -0.05, 0);
part_type_speed(jump_part, 1, 3, 0, 0);
part_type_direction(jump_part, 160, 380, 0, 10);
part_type_color1(jump_part, color_);
part_type_life(jump_part, room_speed/2, room_speed);

wall_part = part_type_create();
part_type_shape(wall_part, pt_shape_sphere);
part_type_size(wall_part, 0.01, 0.05, -0.01, 0);
part_type_speed(wall_part, 1, 3, 0, 0);
part_type_direction(wall_part, 260, 280, 0, 10);
part_type_gravity(wall_part, .5, 270);
part_type_color1(wall_part, color_);
part_type_life(wall_part, 10, 20);

//ground_up_part = part_type_create();
//part_type_shape(ground_up_part, pt_shape_sphere);
//part_type_size(ground_up_part, 0.1, 1, -0.01, 0);
//part_type_speed(ground_up_part, 5, 15, -.5, 0);
//part_type_direction(ground_up_part, 90, 90, 0, 10);
//part_type_color1(ground_up_part, color_);
//part_type_life(ground_up_part, 5, 10);

//ground_left_part = part_type_create();
//part_type_shape(ground_left_part, pt_shape_sphere);
//part_type_size(ground_left_part, 0.1, 1, -0.01, 0);
//part_type_speed(ground_left_part, 5, 15, -.5, 0);
//part_type_direction(ground_left_part, 180, 180, 0, 10);
//part_type_color1(ground_left_part, color_);
//part_type_life(ground_left_part, 5, 10);

//ground_right_part = part_type_create();
//part_type_shape(ground_right_part, pt_shape_sphere);
//part_type_size(ground_right_part, 0.1, 1, -0.01, 0);
//part_type_speed(ground_right_part, 5, 15, -.5, 0);
//part_type_direction(ground_right_part, 0, 0, 0, 10);
//part_type_color1(ground_right_part, color_);
//part_type_life(ground_right_part, 5, 10);

#endregion

#region // Layer IDs for the shader
// Grab the IDs for all the layers we want the light to work on
tile_layer_id			  = layer_get_id("tiles");
background_tiles_layer_id = layer_get_id("background_tiles");
grass_objects_layer_id	  = layer_get_id("grass_objects");
enemy_layer_id			  = layer_get_id("enemy");
platform_layer_id		  = layer_get_id("jump_through");
spike_layer_id			  = layer_get_id("spike");
ice_layer_id			  = layer_get_id("ice");
#endregion

#region // Lighting and Camera
// Create the lighting around the player if it doesn't exist already
if (!instance_exists(o_aura_character_light)) {
	instance_create_depth(x, y, 300, o_aura_character_light);
}
// Create the camera if it doesn't exist already
if (!instance_exists(o_camera)) {
	instance_create_layer(0, 0, "player", o_camera);
	o_camera.camera_target_ = self;
}
#endregion

#region // Player variables

#region // Velocity and sub-pixel movement
// Velocity
hspd = 0; // Horizontal movement speed variable
vspd = 0; // Vertical movement speed variable

// Sub-pixel movement variables -- ensure the player will only move once their speed reaches a whole number
hspd_frac = 0;
vspd_frac = 0;
#endregion

#region // Acceleration, friction, and gravity
// Acceleration, friction and grav_ity
hspd_acc_ground	 = 0.2;	// How fast the player accelerates when on the ground
hspd_acc_air	 = 0.5;	// How fast the player accelerates when in the air
hspd_fric_ground = 0.5; // How fast the player will stop moving
hspd_fric_air	 = 0.1; // How fast the player will stop moving horizontally in the air
grav_air		 = 0.2;	// Gravity when the player is in the air
grav_wall		 = 0.2; // Gravity when the player is on a wall -- this amounts to cling time on a wall as well before moving downward again
grav_dash		 = 0;	// Gravity when the player is dashing
final_acc		 = 0;	// Changes depending on player position, eg. on wall, or ground
final_fric		 = 0;	// Same principal as above
final_grav_		 = 0;	// Same principal as above

// Ice acceleration and friction
hspd_acc_ice  = 0.1;
hspd_fric_ice = 0.03;
#endregion

#region // Max hspeed velocity, jump variables, and max vspeed velocity
// Max hsp_eed velocity
hspd_max_ground = 3; // Move slower on the ground
hspd_max_air	= 5; // Move faster when in the air
final_max_hspd	= 0; // Max hspeed velocity changes based on player position and key presses

// Jump variables
vspd_jump			  = -6;	// Jump height
hspd_wall_jump_length = 3;	// Distance of wall jump
vspd_wall_jump_height = -5;	// Height of wall jump
player_jumped		  = 0;	// Check if player has jumped. false
wall_jump_delay		  = 0;	// Counter to stop player from any input after wall jumping
wall_jump_delay_max	  = 13;	// 13 frames -- if delay is reached, player input is restored
jump_off_max_timer	  = 10;	// 10 frame delay to jump after the player has dropped from a ledge
jump_off_timer		  = jump_off_max_timer; // This is the jump-off timer to be used
vspd_max_jump		  = abs(vspd_jump);	    // Ensure this is positive by using abs()

// Max vsp_eed velocity
vspd_max_fall_speed	    = 4; // Maximum falling speed
vspd_max_wall_slide_spd = 1; // Maximum speed the player will move when sliding down walls
final_max_vspd			= 0; // Max vspeed velocity will change based on the player's position and key presses
vspd_dir_vel			= 0; // Changes depending on the direction the player is moving -- up or down
#endregion

#region // Dash variables
// Dash variables
dash_length	   = 8;			  // Max distance of the dash
hspd_max_dash  = dash_length; // Used to set the hspeed maximum velocity
vspd_max_dash  = dash_length; // Used to set the vspeed maximum velocity
player_dashed  = 0;			  // Check if the player has dashed -- initialized to false
dash_delay	   = 0;			  // Counter to stop the player from submitting any input after dashing
dash_delay_max = 10;		  // 10 frames to stop the player from having any input
dash_direction = 0;			  // Direction the player will dash in
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

#region // Facing
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
effect_shine_max_timer_		= 192; // Maximum number of frames the player can "shine"
effect_shine_timer_			= effect_shine_max_timer_;

// Sound effect timers
sound_fx_run_max_timer = 15; // The number of frames before the run sound is played
sound_fx_run_timer	   = sound_fx_run_max_timer;
#endregion

#region // Player sprite control
// Initial image speed
//image_speed = 0.25;

// Sprite state lookup table
//enum SPRITE {
//	idle,
//	run,
//	jump,
//	fall,
//	wall_slide,
//	dash
//}
// Initial sprite state
//sprite_state = SPRITE.idle;	

// Sprite array table -- assign different sprites to an array position
//sprite_array[SPRITE.idle]		= s_player_idle;
//sprite_array[SPRITE.run]		= s_player_run;
//sprite_array[SPRITE.jump]		= s_player_jump;
//sprite_array[SPRITE.fall]		= s_player_falling;
//sprite_array[SPRITE.wall_slide]	= s_player_wall_slide;
//sprite_array[SPRITE.dash]		= s_player_jump;

//sprite_array[SPRITE.idle]		= s_squish_idle;
//sprite_array[SPRITE.run]		= s_squish_run;
//sprite_array[SPRITE.jump]		= s_squish_jump;
//sprite_array[SPRITE.fall]		= s_squish_falling;
//sprite_array[SPRITE.wall_slide]	= s_squish_wall_slide;
//sprite_array[SPRITE.dash]		= s_squish_jump;

//sprite_array[SPRITE.idle]		= s_ghost_idle;
//sprite_array[SPRITE.run]		= s_ghost_run;
//sprite_array[SPRITE.jump]		= s_ghost_jump;
//sprite_array[SPRITE.fall]		= s_ghost_falling;
//sprite_array[SPRITE.wall_slide]	= s_ghost_wall_slide;
//sprite_array[SPRITE.dash]		= s_ghost_jump;
#endregion

#endregion