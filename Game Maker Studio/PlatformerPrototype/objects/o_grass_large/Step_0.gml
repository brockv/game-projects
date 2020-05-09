/// @description Movement

// Inherit from o_visible_parent  -- obsolete?
//event_inherited();

// Check for the player
if (instance_exists(o_player)) {
	// If they aren't close to the grass, don't do anything
	if (distance_to_object(o_player) <= 1) {
		// Get the distance between the player and the grass
		var xdist = (x - o_player.x) / 2;
		xskew = grass_springing(xskew, xdist, 20, 0.9);
	}
}