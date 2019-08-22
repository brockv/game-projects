/// @description End step logic

// Move the light with the player if they exist
if (instance_exists(o_player)) {
	x = o_player.x - (sign(o_player.facing_) * 10);
	y = o_player.y - 20;
// Destroy the light object if the player doesn't exist
} else {
	instance_destroy();
}