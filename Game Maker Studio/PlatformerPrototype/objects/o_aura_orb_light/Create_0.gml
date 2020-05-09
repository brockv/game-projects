///@description Initialize variables

// Initialize the light
sprite_index = s_aura_point_light;
Aura_Light_Init(2, c_yellow, 1, false, true);
//Aura_Light_Init(8, merge_color(c_white, merge_color(c_red, c_orange, 0.2), 0.8), 1, false, true);

// Movement variables
time_		= 0;
delta_time_ = pi / (3 * room_speed);
x_rad_		= 10;
y_rad_		= 5;

// Direction variable
direction_ = 1;

// Set the flicker alarm
alarm[0] = 1;