/// @description  Create shadow casting surfaces
Aura_Shadow_Caster_Box_Init();

/// Initialize variables.
/*
starting_y = ystart;
stopping_y = -ystart;
slide_increment = 2;
slide_duration  = room_speed;
*/

// Change from Static to Dynamic light.
// Example of changing a static light to dynamic, and back again.

// First define the shadow mesh

Aura_Shadow_Caster_Box_Init();

// Call an alarm to check for a collision with the active player.
alarm[0] = room_speed;

/* */
/*  */
