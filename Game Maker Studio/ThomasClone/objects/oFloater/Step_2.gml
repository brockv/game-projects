/// @description  Update physics position.

v = phy_position_y - pyp;

if (v < 1 && v > -1) {
    repeatY += v;
}

if (v >= 1 || v <= 1)
    repeatY = v;

// Hacky hack
with (oPlayer) {
    if (v <= 0) {
        if (place_meeting(x, y + other.v, other.id) || platformTarget == other.id) {
            // Stay on top of floater
            y = other.y - 8;
        }
    }
}


if (v < 1 && v > -1) {
    if (repeatY <= -1)
        repeatY += 1;
    else if repeatY >= 1
        repeatY -= 1;   
}

// Not sure if this is needed
y = phy_position_y;

