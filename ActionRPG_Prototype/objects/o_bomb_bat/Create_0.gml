/// @description Initialize Variables

// Inherit from the enemy parent object
event_inherited();

// Enum to control the hornet's states
enum bomb_bat
{
	hit,
	idle,
	move,
	attack,
	wait
}

// Set the starting state
starting_state_ = bomb_bat.idle;
state_ = starting_state_;

// Set enemy specific variables
targets_ = [o_player, o_enemy_parent, o_destroyable_object_parent];
damage_ = 2;
knockback_ = 12;

// Set the image index to 0
image_index = 0;

// Randomly choose a direction to face when created
image_xscale = choose(1, -1);

// Initialize the idle alarm
alarm[1] = random_range(0, 1) * global.one_second;
