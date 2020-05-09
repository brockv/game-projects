/// @description Initialize Variables

// Initialize the object
initialize_hurtbox_entity();

// Adjust the depth
depth = -y - 10;

// Effect variables
sprite_ = noone;
image_speed_ = random_range(0.4, 0.8);
has_depth_ = true;