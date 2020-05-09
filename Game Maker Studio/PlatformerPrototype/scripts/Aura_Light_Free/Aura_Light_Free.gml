/// @function		Aura_Light_Free();
/// @description	Free the light surface.

// This script should be called if you destroy the light instance before the room ends, 
// otherwise it is called automatically when you call Aura_CleanUp() script on room end.

if surface_exists(aura_light_surface)
{
surface_free(aura_light_surface);
}
