/// @description Destroy logic

// If the item is in the list of destroyed objects, don't create the animation effect
if (!is_in_destroyed_list(id)) {
	// Create an effect when destroyed
	create_animation_effect(s_gem_shine_effect, x, y - 8, 1, false);
}

// Inherit the parent event
event_inherited();
