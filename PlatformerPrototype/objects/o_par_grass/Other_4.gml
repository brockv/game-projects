/// @description Destroy persistent grass objects outside the first two rooms
if (persistent = true) {
	if (!room = rm_menu || !room = rm_test) {
		instance_destroy();
	}
}