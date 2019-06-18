/// @description  Opens the door.

if collision_point(x + (sprite_width / 1.5), y + (sprite_height / 1.5), oSensor, false, false) {
    alarm[0] = 1;
    with (obj_Aura_Light_Parent) {
        // Check the instance is within a light source
        if place_meeting(x, y, other) {
            // It is so update!
            aura_light_update = true;
        }
    }
    // Move the instance based on whether it is vertical or horizontal
    if image_xscale > image_yscale {
        if x > xstart - sprite_width {
            x -= 2;
        } else {
            alarm[1] = 1;
        }
    } else {
        if y > ystart - sprite_height {
            y -= 2;
        } else {
            alarm[1] = 1;
        }
    }
} else alarm[1] = room_speed;

