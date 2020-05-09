/// @description Movement logic

if (move_) {
	if (go_up_) move_towards_point(x, up_position_, 1);
	if (go_down_) move_towards_point(x, down_position_, 1);
}

if (go_up_ && y == up_position_) {
	speed = 0;
	move_ = false;
}

if (go_down_ && y == down_position_) {
	speed = 0;
	move_ = false;
}

