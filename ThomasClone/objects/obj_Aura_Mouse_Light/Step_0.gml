/// @description  Update the sensor with the active player object.
with (oParEntity) {
     if (active) {
        other.x = x;
        other.y = y;
     }
}

// Update depth
depth = -200;

