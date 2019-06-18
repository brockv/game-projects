/// @description Idle State

// Slow down the image speed
image_speed = 0.35;

// Check if the idle alarm has ended, and reset it 
if (alarm[1] <= 0) {
	alarm[1] = random_range(2, 4) * global.one_second;
	state_ = hornet.move;
	direction_ = random(360);
}

// Catch sprite image exceptions
if (sprite_index != s_hornet_fly) sprite_index = s_hornet_fly;

// Determine if we should attack
hornet_attack();