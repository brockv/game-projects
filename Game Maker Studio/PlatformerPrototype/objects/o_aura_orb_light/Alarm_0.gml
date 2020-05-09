///@description Flicker alarm

// Give the light a flicker effect
aura_light_alpha = random_range(0.50, 1.0);

// Reset the alarm
alarm[0] = 0.1 * room_speed;
