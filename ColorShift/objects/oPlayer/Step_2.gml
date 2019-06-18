/// @description  Inherit Entity
event_inherited();

/// Procedural Animation

xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

// Update depth.
depth = -150;

/// Death

// Crushed by moving solid
if (place_meeting(x, y, oParSolid)) {
    //AssemblePixels(x, y, oExplode, sprite_index, 70, 4, image_blend, false)
    instance_destroy();
}

