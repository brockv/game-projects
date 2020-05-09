///@description resolution_switch()

// This script is used to switch between fullscreen and windowed mode

with(o_resolution) {
	//// Set the resolution to 1920 x 1080 before switching to fullscreen
	//var _resolution = noone;
	//if (!window_get_fullscreen()) {
	//	// This is the index for 1920 x 1080
	//	_resolution = [[1920, 0], [1080, 1]];
	//} else {
	//	// This was the resolution before switching to fullscreen
	//	_resolution = o_control.resolution_selected_;
	//}
	
	//// Change the resolution accordingly
	//resolution_set(_resolution);
	
	// Toggle between fullscreen and windowed mode
    window_set_fullscreen(!window_get_fullscreen());
	
	// Configure the resolution based on fullscreen and windowed mode
    resolution_configure();
}