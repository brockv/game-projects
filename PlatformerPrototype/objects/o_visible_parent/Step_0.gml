/// @description Step logic

// If the player exists, adjust image alpha based on proximity to their light source
if (instance_exists(o_player)) {
	// If this object isn't within the player's light radius, set the fade alarm
	if (!point_in_circle(x, y, o_player.x, o_player.y - (sprite_height / 2), o_player.radius)) {
		if (alarm[0] <= 0) alarm[0] = 10;
	// Otherwise, set the image alpha directly
	} else {
		if (!collision_line(x, y - sprite_height, o_player.x, o_player.y, o_collision_parent, false, true)) {				
			image_alpha = 1;
			//var fadeRange = o_player.radius;
			//var fadeThresh = 12;
			//var playerDis = distance_to_object(o_player);
			//image_alpha = (fadeThresh + fadeRange - playerDis) / fadeRange;
		}
	}
// If the player doesn't exist, set the fade alarm
} else {
	if (alarm[0] <= 0) alarm[0] = 10;
}