/// @description resolution_set(id)
/// @arg ID
// This script is used to change the size of the windowed resolution

with(o_resolution) {
    current_resolution_id_ = argument[0];
    current_width_ = resolution_list_[current_resolution_id_, 0];
    current_height_ = resolution_list_[current_resolution_id_, 1];
    resolution_configure();
}