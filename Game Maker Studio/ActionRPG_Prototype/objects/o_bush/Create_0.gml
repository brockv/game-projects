/// @description Initialize Variables

// Inherit from the parent object
event_inherited();

// Set item-specific effect variables
sprite_ = s_bush_effect;
has_depth_ = true;

// Check if this object was already destroyed, and destroy it again if so
if (is_in_destroyed_list(id)) {
	instance_destroy();
}