/// @description Hit State

// Apply movement
move_movement_entity(true);

// Apply friction
apply_friction_to_movement_entity();

// Return to the initial state if speed is null
if (speed_ == 0) {
	state_ = starting_state_;
}
