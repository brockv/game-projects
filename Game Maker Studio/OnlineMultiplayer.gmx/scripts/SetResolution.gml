/// SetResolution();

// Set the resolution, or get it from the device
var displayWidth  = global.displayWidth;
var displayHeight = global.displayHeight;

// Update the resolution
var baseWidth = 1024;
var baseHeight = 768;

// Determine aspect ratio
var aspect = baseWidth / baseHeight;

// Work out the adjusted width and height
if (displayWidth >= displayHeight) {
   var height = min(baseHeight, displayHeight); 
   var width  = height * aspect;
}

// Resize the application surface
surface_resize(application_surface, width, height);

// Resize the GUI
//display_set_gui_size(displayWidth, displayHeight);

// Resize the game window
window_set_size(displayWidth, displayHeight);



