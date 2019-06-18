/// @function					Aura_Light_ReInit(iterations);
/// @description				Recreate an existing light source when the surface has been lost
/// @param {real}	iterations	The number of iterations to attempt before failing the light

show_debug_message("Light surface re-initialised");

// Create a count variable for the checking iterations
var count = 0;

while (!surface_exists(aura_light_surface) && count < argument0)
{
aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);
count++;
}

// If the light surface can't be initialised, switch it off.
if count >= argument0
{
show_debug_message("Light Surface Error - Light has been disabled");
aura_light_update = false;
aura_light_enabled = false;
return false
}
else
{
// Set the light to update since it has been re-created
aura_light_update = true;
return true;
}
