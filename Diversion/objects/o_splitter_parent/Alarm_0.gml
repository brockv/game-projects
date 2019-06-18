///@description Toggle active state

// If a splitter isn't recieving a laser, it automatically turns off
active_ = false;
color_ = start_color_;
beam_color_ = noone;

// Empty the color list when the splitter turns off
ds_list_empty(color_list_);
