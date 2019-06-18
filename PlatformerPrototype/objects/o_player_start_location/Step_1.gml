/// @description Create player if the player has died

// If the player is dead, start the player death timer
if (player_death) {
	player_death_timer -= 1;
}

// If the player death timer has reached zero, respawn the player and reset player death flag to zero (false).
if player_death_timer <= 0 {
	// Reset player death
	player_death = 0;
	
	// Create the player
	if (!instance_exists(o_player)) instance_create_layer(x,y-sprite_height-2,"player",o_player);
	
	// Reset player death timer
	player_death_timer = player_death_max_timer;
}