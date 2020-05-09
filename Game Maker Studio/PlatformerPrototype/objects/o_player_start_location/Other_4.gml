/// @description Reset spawn coordinates

if (instance_exists(o_player)) {
	if (o_player.start_position_ != noone) {
		spawn_x_ = o_player.start_position_.x;
		spawn_y_ = o_player.start_position_.y;
	}
}