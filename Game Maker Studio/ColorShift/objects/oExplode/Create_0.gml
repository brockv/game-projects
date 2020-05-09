/// @description  Initialize exploding variables.

with (oParEntity) {
     if (active) {
        other.sprite_index = sprite_index;
     }
}

image_xscale = 0.2;
image_yscale = image_xscale;
alarm[0]     = room_speed*2;
image_blend  = image_blend;

