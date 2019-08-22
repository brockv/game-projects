/// @description Initialize player variables

color_			= c_white;

room_			= noone;
start_position_ = noone;

#region // Player particle system
// Create the particle system for the player's body
part_sys_ = part_system_create();
part_system_draw_order(part_sys_, true);
body_emitter_ = part_emitter_create(part_sys_);

// Create the particle for the main body
body_part_ = part_type_create();
part_type_shape(body_part_, pt_shape_sphere);
part_type_size(body_part_, 0.2, 0.5, -0.05, 0);
part_type_speed(body_part_, 0, 0.01, 0, 0);
part_type_direction(body_part_, 0, 360, 0, 10);
part_type_color1(body_part_, color_);
part_type_life(body_part_, room_speed / 2, room_speed);
part_emitter_stream(part_sys_, body_emitter_, body_part_, 10);

// Create the particle for jump effects
jump_part_ = part_type_create();
part_type_shape(jump_part_, pt_shape_sphere);
part_type_size(jump_part_, 0.2, 0.8, -0.05, 0);
part_type_speed(jump_part_, 1, 3, 0, 0);
part_type_direction(jump_part_, 160, 380, 0, 10);
part_type_color1(jump_part_, color_);
part_type_life(jump_part_, room_speed/2, room_speed);

// Create the particle for wall slide effects
wall_part_ = part_type_create();
part_type_shape(wall_part_, pt_shape_sphere);
part_type_size(wall_part_, 0.01, 0.05, -0.01, 0);
part_type_speed(wall_part_, 1, 3, 0, 0);
part_type_direction(wall_part_, 260, 280, 0, 10);
part_type_gravity(wall_part_, .5, 270);
part_type_color1(wall_part_, color_);
part_type_life(wall_part_, 10, 20);
#endregion

#region // Layer IDs for the shader
// Grab the IDs for all the layers we want the light to work on
//tile_layer_id_			  = layer_get_id("tiles");
//hidden_tile_layer_id_	  = layer_get_id("hidden_tiles");
//background_tiles_layer_id_ = layer_get_id("background_tiles");
//grass_objects_layer_id_	  = layer_get_id("grass_objects");
//enemy_layer_id_			  = layer_get_id("enemy");
//platform_layer_id_		  = layer_get_id("jump_through");
//spike_layer_id_			  = layer_get_id("spike");
//ice_layer_id_			  = layer_get_id("ice");
#endregion

#region // Lighting and Camera
// Light radius_ variables
minimum_radius_ = 64;
radius_ = minimum_radius_;

// Create the lighting around the player if it doesn't exist already
if (!instance_exists(o_aura_character_light)) {
	instance_create_layer(x, y - sprite_height / 2, "player", o_aura_character_light);
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
hspd_ = 0; // Horizontal movement speed variable
vspd_ = 0; // Vertical movement speed variable

// Sub-pixel movement variables -- ensure the player will only move once their speed reaches a whole number
hspd_frac_ = 0;
vspd_frac_ = 0;
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
hspd_max_ground_ = 3; // Move slower on the ground
hspd_max_air_	 = 5; // Move faster when in the air
final_max_hspd_	 = 0; // Max hspeed velocity changes based on player position and key presses

// Jump variables
vspd_jump_				= -6; // Jump height
hspd_wall_jump_length_	= 3;  // Distance of wall jump
vspd_wall_jump_height_	= -5; // Height of wall jump
player_jumped_			= 0;  // Check if player has jumped. false
wall_jump_delay_		= 0;  // Counter to stop player from any input after wall jumping
wall_jump_delay_max_	= 13; // 13 frames -- if delay is reached, player input is restored
jump_off_max_timer_		= 10; // 10 frame delay to jump after the player has dropped from a ledge
jump_off_timer_			= jump_off_max_timer_; // This is the jump-off timer to be used
vspd_max_jump_			= abs(vspd_jump_);	  // Ensure this is positive by using abs()

// Max vspeed velocity
vspd_max_fall_speed_	 = 4; // Maximum falling speed
vspd_max_wall_slide_spd_ = 1; // Maximum speed the player will move when sliding down walls
final_max_vspd_			 = 0; // Max vspeed velocity will change based on the player's position and key presses
vspd_dir_vel_			 = 0; // Changes depending on the direction the player is moving -- up or down
#endregion

#region // Dash variables
// Dash variables
dash_length_	= 8;			// Max distance of the dash
hspd_max_dash_  = dash_length_; // Used to set the hspeed maximum velocity
vspd_max_dash_  = dash_length_; // Used to set the vspeed maximum velocity
player_dashed_  = 0;			// Check if the player has dashed -- initialized to false
dash_delay_	    = 0;			// Counter to stop the player from submitting any input after dashing
dash_delay_max_ = 10;		    // 10 frames to stop the player from having any input
dash_direction_ = 0;			// Direction the player will dash in
#endregion

#region // Ground and wall checks
// Checks to see if player on ground or on a wall
player_on_ground_	  = false; // Check if the player is currently on the ground
player_on_wall_left_  = false; // Check if the player is currently colliding with left wall
player_on_wall_right_ = false; // Check if the player is currently colliding with right wall
player_on_wall_		  = false; // Check if the player is colliding with any wall
player_on_jt_		  = false; // Check if the player is on top of a jump through platform
player_inside_jt_	  = false; // Check if the player is inside of a jump through platform
#endregion

#region // Facing
// Player facing direction
facing_ = 1; // 1 == right, -1 == left
#endregion

#region // Input check
// Input check -- mainly used for dash direction and horizontal movement direction
h_input_dir_ = 0; // Check if left or right button is pressed
v_input_dir_ = 0; // Check if up or down button is pressed
#endregion

#region // Timers
// Player effects timers
effect_wall_slide_max_timer_ = 5; // Create a new particle every 5 frames, if player is sliding down a wall
effect_wall_slide_timer_	 = effect_wall_slide_max_timer_; 

effect_run_max_timer_ = 5; // Create a new particle every 5 frames, if player is running on the ground
effect_run_timer_	  = effect_run_max_timer_;

effect_shine_max_timer_	= 192; // Maximum number of frames the player can "shine"
effect_shine_timer_		= effect_shine_max_timer_;

// Sound effect timers
sound_fx_run_max_timer_ = 15; // The number of frames before the run sound is played
sound_fx_run_timer_	    = sound_fx_run_max_timer_;
#endregion

#endregion