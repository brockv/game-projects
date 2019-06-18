/// @description Step logic

if (keyboard_check_pressed(vk_up)) {
	zoom_++;
	if (zoom_ > max_zoom_) zoom_ = 1;
	//display_set_gui_size(ideal_width_, ideal_height_);
	window_set_size(ideal_width_ * zoom_, ideal_height_ * zoom_);	
	surface_resize(application_surface, ideal_width_ * zoom_, ideal_height_ * zoom_);
	
	//view_wport[0] = ideal_width_ * zoom_;
	//view_hport[0] = ideal_height_ * zoom_;
	camera_set_view_size(0, ideal_width_ * zoom_, ideal_height_ * zoom_);
	
	alarm[0] = 1;
} else if (keyboard_check_pressed(vk_down)) {
	zoom_--;
	if (zoom_ < 1) zoom_ = max_zoom_;
	//display_set_gui_size(ideal_width_, ideal_height_);
	window_set_size(ideal_width_ * zoom_, ideal_height_ * zoom_);	
	surface_resize(application_surface, ideal_width_ * zoom_, ideal_height_ * zoom_);
	
	camera_set_view_size(0, ideal_width_ * zoom_, ideal_height_ * zoom_);
	
	alarm[0] = 1;
}
