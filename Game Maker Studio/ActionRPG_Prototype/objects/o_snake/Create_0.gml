/// @description Initialize Variables

// Inherit from the enemy parent object
event_inherited();

// Enum to control the porcupine's states
enum snake {
	hit,
	idle,
	move,
	attack,
	wait
}

// Set the starting state
starting_state_ = snake.idle;
state_ = starting_state_;

// Set the image index to 0
image_index = 0;

// Randomly choose a direction to face when created
image_xscale = choose(1, -1);

// Initialize the idle alarm
alarm[1] = random_range(0, 1) * global.one_second;
