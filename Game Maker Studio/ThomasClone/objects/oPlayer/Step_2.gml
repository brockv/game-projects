/// @description  Inherit Entity
event_inherited();

/// Procedural animation.

xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

// Update depth
depth = depth;

/// Death.

// Crushed by moving solid
if (place_meeting(x, y, oParSolid)) {
    instance_destroy();
}

