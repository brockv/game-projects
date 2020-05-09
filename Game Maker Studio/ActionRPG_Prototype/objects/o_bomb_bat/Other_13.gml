/// @description Attack State

// Update the image speed
image_speed = 0.65;

// Move towards the player while trying to explode
var _direction = point_direction(x, y, o_player.x, o_player.y);
var _acceleration = 0.25;
var _max_speed = 1.5;
add_movement_maxspeed(_direction, _acceleration, _max_speed);
move_movement_entity(true);

// If the player moves too far away before we explode, revert to starting state
var _distance_to_player = point_distance(x, y, o_player.x, o_player.y);
if (_distance_to_player > 80)
{
	state_ = bomb_bat.idle;
	alarm[2] = 0;
	event_user(state_);
}