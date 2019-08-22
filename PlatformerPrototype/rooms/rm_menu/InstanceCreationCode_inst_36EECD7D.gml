if (room = rm_menu || room = rm_test) {
	persistent = true;
} else {
	persistent = false;
	instance_destroy();
}