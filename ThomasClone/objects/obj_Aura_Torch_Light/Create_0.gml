// Here we are creating a torch light. You can create lights of different 
// sizes and shapes as long as the radius initialised before in large 
// enough to fit the sprite rotated around it's origin. This is slightly 
// wasteful of memory, but fsater to process than creating smaller surfaces
// and rotating them at the correct position through maths.

// This light is flagged as NOT being static so it is updated every step...

Aura_Light_Init(sprite_width, merge_colour(c_white, c_yellow, 0.5), 1, false);

