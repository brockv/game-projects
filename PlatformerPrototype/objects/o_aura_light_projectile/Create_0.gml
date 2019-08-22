/// @description Initialize variables

// Radius variables
radius_          = 32;
expanded_radius = 128;

// Collision flags
h_collision_ = false;
v_collision_ = false;
triggered_   = false;

// Speed variables
hspd_ = 0;
vspd_ = 0;

// Set the flicker alarm
alarm[0] = 1;

// Set the lifespan alarm
alarm[1] = room_speed * 2;

// Initialize the light
Aura_Light_Init(radius_, c_white, 1, false, true);
