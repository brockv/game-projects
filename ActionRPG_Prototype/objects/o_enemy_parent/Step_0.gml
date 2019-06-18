/// @description General Step Logic

// Update depth
//depth = -y;

// Destroy if health is 0 or less
if (health_ <= 0) instance_destroy();

// Revert state if outside of noone
if (state_ != noone) {
	event_user(state_);
}
