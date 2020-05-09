/// @description  Aura_Light_Free();

// Free the light surface. This script should be called if you destroy 
// the light object before the room ends, otherwise it is called automatically 
// when you call Aura_CleanUp() on room end.

if surface_exists(aura_light_surface)
{
surface_free(aura_light_surface);
}
