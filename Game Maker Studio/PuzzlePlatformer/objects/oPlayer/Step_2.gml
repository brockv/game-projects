/// @description  Inherit Entity
event_inherited();

/// Procedural Animation

xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

/// Death

// Crushed by moving solid
if (place_meeting(x, y, oParSolid))
    instance_destroy();

