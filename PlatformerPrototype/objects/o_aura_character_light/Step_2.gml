/// @description End step logic

// Move the light with the player
if (instance_exists(o_player)) {
	x = o_player.x;
	y = o_player.y;
// Destroy the light object if the player doesn't exist
} else {
	instance_destroy();
}