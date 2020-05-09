/// @description Move State

// Adjust the image speed to reflect movement
var _image_speed = 0.35;
image_speed = _image_speed;

// Grab the horizontal speed to use for changing facing
var _x_speed = lengthdir_x(speed_, direction_);

// If the horizontal speed isn't 0, face the appropriate way
if (_x_speed != 0) {
	image_xscale = sign(_x_speed);
}

// Check if the idle alarm has ended, and apply appropriate movement logic
if (alarm[1] <= 0) {
	apply_friction_to_movement_entity();
} else {
	var _acceleration = 0.05;
	var _max_speed = 0.5;
	add_movement_maxspeed(direction_, _acceleration, _max_speed);
}

// Move the enemy
move_movement_entity(true);

// Move back to idle state if speed is at 0, and reset the idle alarm
if (speed_ == 0) {
	alarm[1] = random_range(1, 3) * global.one_second;
	state_ = porcupine.idle;
}

// Should we attack the player?
porcupine_attack();
