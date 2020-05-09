/// @description  Initialize Variables

// Jumping and Platforms
jumped = false;
landed = false;

platformTarget = 0;
wallTarget     = 0;

// Velocity
vx = 0;
vy = 0;

// Used for sub-pixel movement
cx = 0;
cy = 0;

onGround = OnGround();
cLeft    = place_meeting(x - 1, y, oBlock) || place_meeting(x - 1, y, oParEntity);
cRight   = place_meeting(x + 1, y, oBlock) || place_meeting(x + 1, y, oParEntity);

