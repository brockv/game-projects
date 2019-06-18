/// @description  Initialize variables.

// Inherit Entity
event_inherited();

// Switching shapes
changingShapes = false;
switchCharges  = 200;
prevShape      = sprite_index;

// Movement speeds
h = 0;
v = 0;

// WATER
lqd     = 0;
prvlqd  = 0;
slqd    = 0;
sprvlqd = 0;
splashdelay = 4;

// Facings
RIGHT =  1;
LEFT  = -1; 

// Movement Vars //////////////////////////////////////////////////////////////

// Adjust THIS to adjust overall player speed
m       = 1;
normalM = m;
waterM  = 0.5;

//// Acceleration + friction
groundAccel = 1.0  * m;
groundFric  = 2.0  * m;
airAccel    = 0.75 * m;
airFric     = 0.10 * m;

// Max movement speeds
maxH        = 5.5  * m;
maxV        = 9.0  * m;

jumpHeight  = 7.0  * m;
gravRise    = 0.5  * m;
gravFall    = 0.5  * m;
gravSlide   = 0.25 * m;


// Movement ///////////////////////////////////////////////////////////////////

//groundAccel = 1.00;
//groundFric  = 2.00;
//airAccel    = 0.50;
//airFric     = 0.05;
vxMax       = 7.50;
vyMax       = 16.0;
gravNorm    = 0.66;
//jumpHeight  = 9.00;
//gravNorm    = 0.66;
//gravSlide   = 0.33;

clingTime   = 4.0;

// Misc ///////////////////////////////////////////////////////////////////////

// States
IDLE      = 10;
RUN       = 11;
JUMP      = 12;

jumpSound = snd_RectangleJump;

// Initialize properties
state  = Movement;
facing = image_xscale; // Change xscale in editor to adjust initial facing

// For squash + stretch
xscale = 1;
yscale = 1;

///////////////////////////////////////////////////////////////////////////////

// Legacy code, haha
sticking = false

/* */
/// Create shadow casting surfaces.

var xw = sprite_width / 2;
var yh = sprite_height / 2;
Aura_Shadow_Caster_Poly_Init();
Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);

/* */
/*  */
