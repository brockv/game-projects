// Create the box (rectangle) shadow casting instance, based on the instance properties
// If you set the image xscale or yscale in the room editor then this will adapt.
// Note that it does NOT take into account rotation, and can only be a vertical or
// horizontal rectangle.

Aura_Shadow_Caster_Box_Init();


// DEMO code below can be removed

direction = choose(0, 90, 180, 270);
speed = 1 + irandom(3);
alarm[0] = room_speed;

