/// @description Hit State

// Reset the image index
image_index = 0;

// Apply movement and change bounce to true
move_movement_entity(true);

// Apply friction
apply_friction_to_movement_entity();

// Enter the starting state if speed equals 0
if (speed_ == 0)
{
	state_ = starting_state_;
}
