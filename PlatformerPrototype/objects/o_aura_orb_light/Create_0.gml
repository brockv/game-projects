///@description Initialize variables

// Initialize the light
sprite_index = s_aura_point_light;
Aura_Light_Init(8, c_white, 1, false, true);
//Aura_Light_Init(8, merge_color(c_white, merge_color(c_red, c_orange, 0.2), 0.8), 1, false, true);

// Set the flicker alarm
//alarm[0] = 1;