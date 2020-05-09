/// @description  Squash and Stretch + Dust Particles
var onGroundPrev = onGround;

event_inherited();

// Landing after jump
if (onGround && !onGroundPrev) {
    // Squash + Stretch
    xscale = 1.5;
    yscale = 0.85;
    
    // Dust particles
    for (var i = 0; i < 4; i++)
        instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
}

