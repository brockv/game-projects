/// @description Check input directions and collisions

// Run input script
check_controller_input();

// Check input direction
h_input_dir	= player_right_check - player_left_check; // -1 if left pressed, 0 if both or none, 1 if right
v_input_dir = player_down_check  - player_up_check;	

// Check if the player is colliding with the floor or walls
player_on_ground		= place_meeting(x, y + 1, o_collision_parent);
player_on_ice			= place_meeting(x, y + 1, o_ice_block);

// Wall collision check
player_on_wall_left		= place_meeting(x - 1, y, o_collision_block);
player_on_wall_right	= place_meeting(x + 1, y, o_collision_block);
player_on_wall			= player_on_wall_right - player_on_wall_left;

// Jump through platform -- can be made a child object of a parent jump through object if we have different sprites
player_on_jt	= place_meeting(x, y + 1,o_jump_through_wood);
player_inside_jt = place_meeting(x, y, o_jump_through_wood);


