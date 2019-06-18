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

// Check for any AI characters, and make sure they are close to the grass
if (instance_exists(o_ai_entity)) {
	// If they aren't close to the grass, don't do anything
	if (distance_to_object(o_ai_entity) <= 1) {
		// Get distance between the entity and the grass
		var closest = instance_nearest(x, y, o_ai_entity);
		var xdist = x - closest.x;
		xskew = grass_springing(xskew, xdist, 20, 0.9);
	}
}