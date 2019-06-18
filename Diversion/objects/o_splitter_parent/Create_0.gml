///@description Initialize variables

// Inherit from o_draggable_parent
event_inherited();

correct_position_x_ = noone;
correct_position_y_ = noone;

// Define variables
active_ = false;
image_speed = 0;
image_index = active_;
start_color_ = noone;
beam_color_ = noone;
color_ = start_color_;

// Initialize a list to keep track of all colors touching the splitter
color_list_ = ds_list_create();

// Delay particle system creation
alarm[1] = 1;

// Set the active state toggle alarm
alarm[0] = 1;

// Set the default angle of the splitter
angle_ = image_angle;
image_angle = angle_;
    
// Angle that the splitter changes upon each click
rotation_ = 90;
    
// Set the radius for clicking on the splitter
radius_ = (sprite_height / 2);
