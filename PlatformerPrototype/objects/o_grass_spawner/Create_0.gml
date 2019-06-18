/// @description Create grass objects

// Amount of grass to spawn
amount = 15;

// Distance at which to spawn grass at, in pixels
width = 32;

// Create the grass
for (var i = amount; i > 0; i-- ) {
	xx[i]		= irandom_range(-width / 2, width / 2); // where to spawn grass from the x position.
	object[i]	= choose(o_grass_large, o_grass_medium, o_grass_small);// what grass object to spawn.
	instance_create_layer(x + xx[i], y, "grass_objects", object[i]);	// Create the grass objects
}