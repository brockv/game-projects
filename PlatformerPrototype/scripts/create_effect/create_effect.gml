/// @description create_effect(x, y, sprite, animation_speed)
/// @param x
/// @param y
/// @param sprite
/// @param animation_speed
/*
 * Create an effect (essentially a particle)
 * with a given position, sprite, and animation speed.
 */
 
// Create the effect
var a = instance_create_layer(argument[0], argument[1], "enemy", o_dust_effect);

// Set the sprite index and image speed of the effect
a.sprite_index = argument[2];
a.image_speed = argument[3];

// Return the effect
return (a);
