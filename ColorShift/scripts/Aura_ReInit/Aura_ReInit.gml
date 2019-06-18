/// @description  Aura_ReInit(ambient_alpha, ambient_colour);
/// @param ambient_alpha
/// @param  ambient_colour

// Recreate the main surface if necessary. Since we are using surfaces, these 
// can disappear at any time and so we need to catch this and deal with it 
// otherwise the game will crash and the plater get an error.

var count = 0;      // This variable will be used to check that a surface has actually been created

// Create the surface and check it exists
while (!surface_exists(aura_surface) && count < 50)
{
if view_enabled
    {
    aura_surface = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
    }
else
    {
    aura_surface = surface_create(room_width, room_height);
    }
count++;
}

// If it STILL doesn't exist, return an error
if count >= 50
{
// Show the user a message...
show_message("Surface error - You may not have enough memory to run this game");
return false
}
else return true;
