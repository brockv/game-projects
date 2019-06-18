/// @description Idle State

// Reset the image index and speed
image_index = 0;
image_speed = 0;

// Check if the idle alarm has ended, and reset it 
if (alarm[1] <= 0) {
	alarm[1] = random_range(2, 4) * global.one_second;
	state_ = porcupine.move;
	direction_ = random(360);
}

// Catch sprite image exceptions
if (sprite_index != s_porcupine_run) sprite_index = s_porcupine_run;

// Determine if we should attack
porcupine_attack();