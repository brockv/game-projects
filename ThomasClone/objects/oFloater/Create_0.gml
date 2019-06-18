/// @description  Initialize movement variables.
h = 0;
repeatX = 0;

v = 0;
repeatY = 0;

pyp = phy_position_y;

// Water below
pool = instance_place(x, y, oWaterMask);

/// Create shadow casting surfaces
Aura_Shadow_Caster_Box_Init();

