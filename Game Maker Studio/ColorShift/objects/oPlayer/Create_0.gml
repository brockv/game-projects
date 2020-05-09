/// @description  Initialize Variables.

// Inherit Entity
event_inherited();

// Prevent player sprite from auto cycling through images
image_speed = 0;

facing = 1;

// Movement ///////////////////////////////////////////////////////////////////

groundAccel = 1.00;
groundFric  = 2.00;
airAccel    = 0.50;
airFric     = 0.05;
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

/// Create shadow casting surfaces.

var xw = sprite_width / 2;
var yh = sprite_height / 2;
Aura_Shadow_Caster_Poly_Init();
Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);

