// Exit if the player is not present
if (!instance_exists(o_player)) exit;

// Determine if the player is within striking distance
var _distance_to_player = collision_rectangle(x + (4 * sign(image_xscale)), y - 8, x + (12 * sign(image_xscale)), y - 16, o_player, false, true);

// Enter the attack state if within 16 pixels of the player
if (_distance_to_player)
{
	state_ = snake.attack;
	image_index = 0;
	sprite_index = s_snake_attack;
}