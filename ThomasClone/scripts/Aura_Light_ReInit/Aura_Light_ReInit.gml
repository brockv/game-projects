/// @description  Aura_Light_ReInit();

// Re-initialise the light surface if it has been removed by the OS or anything
show_debug_message("Light surface re-initialised");

var count = 0;

while (!surface_exists(aura_light_surface) && count < 50)
{
aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);
count++;
}

// If the light surface can't be initialised, switch it off.
if count >= 50
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
