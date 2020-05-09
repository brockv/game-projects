/// @description  Update the sensor with the active player object.
with (oPlayer) {
     other.x = x;
     other.y = y - (sprite_height / 2);
}

// Update depth
depth = -140;

