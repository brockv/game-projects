/// @description  Toggle fullscreen.
switch (fullscreen) {
       case (false):
       
            window_set_fullscreen(true);
            fullscreen = true;
            break;
       
       case (true):
       
            window_set_fullscreen(false);
            fullscreen = false;
            break;
       
       default:
       
            break;
}

