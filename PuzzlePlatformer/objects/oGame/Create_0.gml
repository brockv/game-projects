/// @description  Camera Functions
rm     = -1;
rmPrev = -1;

// Camera /////////////////////////////////////////////////////////////////////

// Camera state
shake     = false;
babyshake = false;
xshake    = choose(-1, 1);
yshake    = choose(-1, 1);
shakeDist = 2;

// Camera offset
xcamo = 0;
ycamo = 0;


/// Path Room Drawing Variables
lx = 0;
ly = 0;

clickInit = mouse_check_button_pressed(mb_left)
clicked   = mouse_check_button(mb_left);

