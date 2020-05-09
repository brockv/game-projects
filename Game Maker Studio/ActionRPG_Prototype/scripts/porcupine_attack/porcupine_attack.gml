// Exit if the player is not present
if (!instance_exists(o_player)) exit;

// Get the distance between the porcupine and the player in pixels
var _distance_to_player = point_distance(x, y, o_player.x, o_player.y);

// Enter the attack state if within 16 pixels of the player
if (_distance_to_player < 16)
{
	state_ = porcupine.attack;
	image_index = 0;
	sprite_index = s_porcupine_attack;
}