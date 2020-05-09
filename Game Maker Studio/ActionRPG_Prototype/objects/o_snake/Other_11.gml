/// @description Idle State

// Reset the image index and speed
image_index = 0;
image_speed = 0.4;

// Check if the idle alarm has ended, and reset it 
if (alarm[1] <= 0) {
	alarm[1] = random_range(2, 4) * global.one_second;
	state_ = snake.move;
	direction_ = random(360);
}

// Catch sprite image exceptions
if (sprite_index != s_snake_idle) sprite_index = s_snake_idle;

// Determine if we should attack
snake_attack();