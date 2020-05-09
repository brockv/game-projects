/// @description Update Player Conditions

// Are we alive?
if (player_health_ <= 0) {
	instance_destroy();
}

// Do we not have all of our stamina?
if ((player_stamina_ < player_max_stamina_) && (alarm[2] <= 0)) {
	alarm[2] = global.one_second * stamina_regen_time_;
}

// Run the appropriate state code
event_user(state_);

// Change the sprite to match the direction the player is facing
sprite_index = sprite_[state_, direction_facing_];
