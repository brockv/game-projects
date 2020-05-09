/// @description  Aura_Light_Init(radius, colour, alpha, static);
/// @param radius
/// @param  colour
/// @param  alpha
/// @param  static

// Initialising the light creates a unique surface for it, and also a 
// number of variables for the instance which can then be modified at 
// any time to change things. Note that if the light is STATIC you can 
// still modify the light and alpha with NO PERFORMANCE LOSS. A good 
// way to get some simple effects light alarm lights without the hit 
// to performance associated with dynamic lights.

// Set the light variables
aura_light_radius = argument0;      // Light radius
aura_light_colour = argument1;      // Light colour
aura_light_alpha = argument2;       // Light alpha
aura_light_static = argument3;      // Set the light to static (true) or dynamic (false)
aura_light_update = true;           // Should the light update (true) or not(false)
aura_light_enabled = true;          // Is the light enabled (true) or not (false)

// Notes:
//     1) Use the "enabled" variable to switch a light on and off
//     2) If a light is flagged as static, you can force it to update by setting 
//        the "update" variable to false. The update is for one frame only.
//     3) If you change a static light to dynamic, you will also need to set the 
//        the update variable to true otherwise it won't change.
//     4) A dynamic light can be made static at any time by simply setting the 
//        static variable to true. It takes one frame to become static.

// The light is drawn to a surface along with the shadow meshes, so create the surface

aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);

