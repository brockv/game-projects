/// @description Move State

// Stop the sprite from automatically cycling
image_speed = 0;

// Sprite animation control variable
var _animation_speed = 0.8;

// Input control variables
var _x_input = o_input.right_ - o_input.left_;
var _y_input = o_input.down_ - o_input.up_;
var _input_direction = point_direction(0, 0, _x_input, _y_input);
input_direction_ = _input_direction;

// Apply movement properties to the player
if (_x_input == 0 && _y_input == 0) // The player isn't pressing a direction
{
	image_index = 0;
	image_speed = 0;
	apply_friction_to_movement_entity();
	
	// Update evade direction when not moving
	evade_direction_ = direction_facing_ * 90;
}
else // The player is pressing a direction
{
	image_speed = _animation_speed;
	if (_x_input != 0) image_xscale = _x_input;
	get_direction_facing(_input_direction);
	add_movement_maxspeed(_input_direction, acceleration_, max_speed_);
	evade_direction_ = _input_direction;
	
	if (o_input.dash_)
	{
		state_ = player.dash;
	}
}

// Listen for equipment slot uses

// Sword
if (o_input.action_sword_)
{
	state_ = player.sword;
}

// Equipment slot 1
if (instance_exists(global.item[0]))
{
	inventory_use_item(o_input.action_one_pressed_, global.item[0], global.item[0].damage_);
}

// Equipment slot 2
if (instance_exists(global.item[1]))
{
	inventory_use_item(o_input.action_two_pressed_, global.item[1], global.item[1].damage_);
}

// Check for interactable objects in the direction we are currently facing
var _x_dir = lengthdir_x(6, direction_facing_ * 90);
var _y_dir = lengthdir_y(6, direction_facing_ * 90);
activate_interactable_object(_x_dir, _y_dir);

// Enable movement with the above scripts
move_movement_entity(false);
