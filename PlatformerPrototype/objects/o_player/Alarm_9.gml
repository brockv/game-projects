/// @description Light control alarm

// Increment the shine time if it's less than the maximum
if (effect_shine_timer_ < effect_shine_max_timer_) {
	effect_shine_timer_++;
	alarm[9] = 10;
}

// Decrement the light's radius if it's greater than the minimum
if (radius > minimum_radius) {
	radius--;
	alarm[9] = 10;
}