/// @description  Update onGround and relative collisions

var temp;

// Check if you were onGround previous frame
temp = on_ground;

onGround = on_ground();
platformTarget = instance_place(x, y + 1, o_collision_parent);

// Squash sprite during jump landing
if (!temp && onGround) {
    if (vsp >= 0) {        
        yscale = 0.66;
        xscale = 1.33;  
    }
}

// Update relative collision
cLeft  = place_meeting(x - 1, y, o_collision_parent);
cRight = place_meeting(x + 1, y, o_collision_parent);
cAbove = place_meeting(x, y - 1, o_collision_parent);

