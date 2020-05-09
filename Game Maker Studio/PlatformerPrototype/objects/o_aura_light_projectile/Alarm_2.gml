/// @description Delay alarm

// Shrink the light and then destroy it
if (radius_ > 1) {
	radius_--;
	alarm[2] = 2;
} else {
	instance_destroy();
}