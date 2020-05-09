///@description Step logic

// Inherit from o_draggable
event_inherited();

// Sets image index depending on whether it's activated or not
image_index = active_;

// Build a new color using ALL of the colors in the color list
if (!ds_list_empty(color_list_)) {
	color_ = add_colors_list(color_list_, 255);
}