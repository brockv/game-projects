/// @description Movement logic

if (move_) {
	if (go_left_) move_towards_point(left_position_, y, 1);
	if (go_right_) move_towards_point(right_position_, y, 1);
}

if (go_left_ && x == left_position_) {
	speed = 0;
	move_ = false;
}

if (go_right_ && x == right_position_) {
	speed = 0;
	move_ = false;
}

