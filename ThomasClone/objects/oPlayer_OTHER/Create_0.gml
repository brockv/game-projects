// Movement speed
h = 0;
v = 0;

// Collision below
onGround = false;
platformTarget = false;

// Movement Vars //////////////////////////////////////////////////////////////

// Adjust THIS to adjust overall player speed
m = 1;

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
state  = IDLE;
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

