// Exit if the player is not present
if (!instance_exists(o_player)) exit;

// Get the distance between the bat and the player in pixels
var _distance_to_player = point_distance(x, y, o_player.x, o_player.y);

// Enter the attack state if within 50 pixels of the player
if (_distance_to_player < 50) {
	state_ = bomb_bat.attack;
	image_index = 0;
	sprite_index = s_bat_fly;
	alarm[2] = global.one_second * 2;
	
	// Play a sound effect to alert the player that the bat is coming
	audio_play_sound(a_bomb_bat_alerted, 4, false);
}