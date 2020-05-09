/// @description Initialize variables

// Inherit from o_draggable_parent
event_inherited();

// Define variables
active_ = false;
filtered_color_ = noone;
laser_color_ = noone;
color_ = noone;

// Set the active state toggle alarm
alarm[0] = 1;

// Delay particle system creation
alarm[1] = 1;