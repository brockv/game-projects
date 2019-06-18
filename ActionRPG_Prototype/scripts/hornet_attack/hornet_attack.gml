// Exit if the player is not present
if (!instance_exists(o_player)) exit;

// Check if the player is within a line of sight to fire a stinger at
var _line_of_fire = collision_line(x, y, x + (80 * sign(image_xscale)), y, o_player, false, true);

// Enter the attack state if the player is within the line of fire
if (_line_of_fire && state_ != hornet.attack)
{
	state_ = hornet.attack;
	image_index = 0;
	sprite_index = s_hornet_fly;
}