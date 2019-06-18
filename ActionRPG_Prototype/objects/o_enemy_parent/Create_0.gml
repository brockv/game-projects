/// @description Initialize Variables

// Initialize movement entity variables
var _friction = 0.5;
var _bounce = 1;
var _collision_object = o_solid;

// Initialize the enemy
initialize_movement_entity(_friction, _bounce, _collision_object);
initialize_hurtbox_entity();

// Set default health values
max_health_ = 2;
health_ = max_health_;

// State control
starting_state_ = noone;
state_ = starting_state_;

// Set image speed to 0 here, and to specific values in children
image_speed = 0;


// Enum to control enemy states
enum enemy {
	hit
}