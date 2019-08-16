///@description Flicker alarm

// Give the light a flicker effect
if (aura_light_alpha < 1) {
	aura_light_alpha += random(0.05);
} else {
	aura_light_alpha = 0.75;
}

// Reset the alarm
alarm[0] = 0.1 * room_speed;

