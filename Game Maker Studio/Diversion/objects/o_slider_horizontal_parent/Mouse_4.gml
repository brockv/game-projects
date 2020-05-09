/// @description Slide the block over

move_ = true;

if (go_left_) {
	go_left_ = false;
	go_right_ = true;
} else {
	go_left_ = true;
	go_right_ = false;
}