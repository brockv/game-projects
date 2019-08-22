/// @description Create grass objects

// Amount of grass to spawn
amount_ = 15;

// Distance at which to spawn grass at, in pixels
width_ = 32;

// Create the grass
for (var i = amount_; i > 0; i-- ) {
	xx_[i]	   = irandom_range(-width_ / 2, width_ / 2); // Where to spawn grass from the x position
	object_[i] = choose(o_grass_large, o_grass_medium, o_grass_small); // What grass object to spawn
	instance_create_layer(x + xx_[i], y, "grass_objects", object_[i]);	// Create the grass objects
}