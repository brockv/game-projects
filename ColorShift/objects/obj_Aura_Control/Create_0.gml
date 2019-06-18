/// @description  Create Aura Lighting Engine.

// This is the main light controller object. It will do all the light 
// drawing and should be set to a depth LOWER than everything that you 
// want the light to appear over. Note that this engine draws the 
// lighting surface using an "overlay" effect, rather than an additive
// effect which gives much better blending and laso means that things 
// drawn under them will not be to brilliant or saturated.

// Please read the comments in each object, and all the scripts to get 
// how the engine works, but breifly you add this object to a room, 
// then add light objects (which MUST have the parent "obj_Aura_Light_Parent")
// and wall/solid objects (which MUST have the parent "obj_Aura_ShadowCaster_Parent")
// Light objects should have their visible flag set to false.

// Now initialise the lighting

// You give an alpha value for the ambience colour. This value is from 1 to 0, with 
// a larger value indicating brighter ambient light. The colour is the "tint" that 
// you ewant the ambient light to have.

Aura_Init(0.5, c_dkgray, true);

// This script creates two further variables which you can use:
//
// aura_alpha - sets the brightness for the ambience
// aura_colour - sets the colour for the ambient light
//
// These variables can be used at any time to change the ambience and so you 
// can use them to create day/night cycles etc... 





