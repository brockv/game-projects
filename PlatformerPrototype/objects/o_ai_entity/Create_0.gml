///@description Initialize variables

// Inherit from o_pathfinding_object
event_inherited();

// Velocity & limits
hsp        = 0;
vsp        = 0;
move_speed = 2;

// grav_ity
grav       = 0.5;
grav_slide = 0.25;
//grav       = 0.25;
//grav_slide = 0.12;

// Friction
air_frict    = 0.10;
ground_frict = 2.00;
//air_frict = 0.04;
//ground_frict = 0.4;

// Acceleration
air_acc    = 0.75;
ground_acc = 1.0;
//air_acc = 0.2;
//ground_acc = 0.4;

// Jumping
jump_height  = 5;
djump_height = 4;
jumps_max    = 1;
jumps        = 0;

// Movement
move_x    = 0;
move_y    = 0;
move_jump = false;

// Clinging
wall_jump   = false; // Can the entity wall-jump?
cling_left  = false;
cling_right = false;
slide_speed = 2;
can_cling   = false;
stick_time  = 12;
stuck_time  = 0;

// Ledge grab
can_grab		 = false; // Can the entity grab ledges?
ledge_grab_block = noone; // The block which we're grabbed on to
ledge_grab_x	 = 0; // The x and y position relative to the grabbed block
ledge_grab_y	 = 0;
ledge_stick		 = 10; // Number of steps needed to hold the left/right key before unsticking from the ledge
ledge_stuck		 = 0;

// Misc
ground   = on_ground();
facing   = 1;
can_wrap = false;
wrapped  = false;
state    = state.normal;
                   
// Sprite state lookup table
//enum SPRITE {
//	idle,
//	run,
//	jump,
//	fall,
//	wall_slide,
//	dash
//}
//// Initial sprite state
//sprite_state = SPRITE.idle;

//// Sprite array table -- assign different sprites to an array position
//sprite_array[SPRITE.idle]		= s_player_idle;
//sprite_array[SPRITE.run]		= s_player_run;
//sprite_array[SPRITE.jump]		= s_player_jump;
//sprite_array[SPRITE.fall]		= s_player_falling;
//sprite_array[SPRITE.wall_slide]	= s_player_wall_slide;
//sprite_array[SPRITE.dash]		= s_player_jump;
