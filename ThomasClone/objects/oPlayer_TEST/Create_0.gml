/// @description  Initialize player variables.

// Movement speed
h = 0;
v = 0;

// Collision below
onGround = false;
platformTarget = false;

// Movement Vars //////////////////////////////////////////////////////////////

// Adjust THIS to adjust overall player speed
m       = 1;
normalM = m;
waterM  = 0.5;

// Acceleration + friction
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

camDist     = 24.0; // (later versions)

// Frames prior to being able to push off of wall slide with arrow keys (doesn't affect wall jump)
clingTime   = 4.0  * m;
///////////////////////////////////////////////////////////////////////////////

// State Info /////////////////////////////////////////////////////////////////
// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;


// Facings
RIGHT =  1;
LEFT  = -1;

// Initialize properties
state  = Idle;
facing = image_xscale; // Change xscale in editor to adjust initial facing

// For squash + stretch
xscale = 1;
yscale = 1;
///////////////////////////////////////////////////////////////////////////////

// Misc ///////////////////////////////////////////////////////////////////////

// Relative collision checks
cLeft  = 0;
cRight = 0;
cAbove = 0;

// Wall slide
canStick = true;
sticking = false;

// Connected oRopeSegment
rope = -1;
// Offset used for climbing
yrope = 8;
canGrabRope = true;

// WATER
lqd     = 0;
prvlqd  = 0;
slqd    = 0;
sprvlqd = 0;
splashdelay = 4;

maxHp      = 12;
hp         = maxHp;
canGetHurt = true;
blink      = 1;

///////////////////////////////////////////////////////////////////////////////

// SHAPE CHANGING STUFF /////////////////////////////////////////////////////////////////
changingShapes = false;
switchCharges  = 200;
prevShape      = sprite_index;
jumpSound      = snd_RectangleJump;

/// Create shadow casting surfaces.

var xw = sprite_width / 2;
var yh = sprite_height / 2;
Aura_Shadow_Caster_Poly_Init();
Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);

