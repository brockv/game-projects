/// @function					Aura_ReInit(iterations)
/// @description				Recreate the main surface if necessary.
/// @param {real}	iterations	The number of times Aura should try to recreate the surface before failing

// Since we are using surfaces, these can disappear at any time and so we need to catch 
// this and deal with it otherwise the game will crash and the player get an error.
// This script is run from within the "Aura_Upate" script, and should NEVER be called
// anywhere else (ie: you shouldn't need to call this yourself ever).

// When this is called we set the iterations to use, which is the number of times that 
// we want AURA to try and create the surface. The default value is 50, but you can 
// change this from the Update script where it is called.

var count = 0;	// This variable will be used to check that a surface has actually been created

// Check the surface exists
if (!surface_exists(aura_surface)) {
	// It doesn't so attempt to recreate it
	while (!surface_exists(aura_surface) && count < argument[0]) {
		if (aura_view > -1) {
			var _vw = camera_get_view_width(view_camera[aura_view]);
			var _vh = camera_get_view_height(view_camera[aura_view]);
		    aura_surface = surface_create(_vw, _vh);
		} else {
		    aura_surface = surface_create(room_width, room_height);
		}
		count++;
	}
	// If it STILL doesn't exist, return an error
	if (count >= argument[0]) {
		// Show the user a message...
		show_message("Surface error - There may not be enough memory to run this game!");
		// This script returns "false" when it fails so you can handle it however you want.
		// By default it calls "game_end" after showing the user the above message, but you can 
		// handle this how you wish by editing the Aura_Update script.
		return false
	}
}

return true;
