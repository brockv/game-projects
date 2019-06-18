/// @description  Initialize Variables

// Inherit Entity
event_inherited();

facing = 1;

// Movement ///////////////////////////////////////////////////////////////////

groundAccel = 1.00;
groundFric  = 2.25;
airAccel    = 0.15;
airFric     = 0.15;
vxMax       = 7.50;
vyMax       = 16.0;
jumpHeight  = 9.00;
gravNorm    = 0.66;
gravSlide   = 0.33; 

clingTime   = 4.0;

// Misc ///////////////////////////////////////////////////////////////////////

// States
IDLE      = 10;
RUN       = 11;
JUMP      = 12;

// Initialize properties
state  = IDLE;
facing = image_xscale; // Change xscale in editor to adjust initial facing

// For squash + stretch
xscale = 1;
yscale = 1;

///////////////////////////////////////////////////////////////////////////////

// Legacy code, haha
sticking = false

