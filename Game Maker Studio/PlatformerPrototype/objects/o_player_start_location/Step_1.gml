/// @description Create player if the player has died

// If the player is dead, start the player death timer
if (player_death) {
	player_death_timer_ -= 1;
}

// If the player death timer has reached zero, respawn the player and reset player death flag to zero (false).
if (player_death_timer_ <= 0) {
	// Reset player death
	player_death = 0;
	
	// Create the player and reset the camera's target if it's already been created)
	if (!instance_exists(o_player)) instance_create_layer(spawn_x_, spawn_y_, "player", o_player);
	if (instance_exists(o_camera)) o_camera.camera_target_ = o_player;
	
	// Reset player death timer
	player_death_timer_ = player_death_max_timer_;
}