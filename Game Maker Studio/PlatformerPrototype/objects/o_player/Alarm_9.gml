/// @description Light control alarm

// If the player presses the button again while this alarm is active, exit the alarm
if (k_charge_pressed) { exit };

// Increment the shine time if it's less than the maximum
if (effect_shine_timer_ < effect_shine_max_timer_) {
	effect_shine_timer_++;
	alarm[9] = 4;
}

// Decrement the light's radius_ if it's greater than the minimum
if (radius_ > minimum_radius_) {
	radius_--;
	alarm[9] = 4;
}