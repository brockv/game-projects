/// @description End step logic

// Move the light with the player
if (instance_exists(o_player)) {
	// Update the light with the player's radius_ value
	Aura_Light_Set_Radius(self, o_player.radius_, true);
	x = o_player.x;
	y = o_player.y - o_player.sprite_height / 2;
// Destroy the light object if the player doesn't exist
} else {
	instance_destroy();
}