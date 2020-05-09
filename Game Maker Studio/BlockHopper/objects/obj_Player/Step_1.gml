/// @description Dust Particle Spawning And Dispersion

if (global.pause) || (!global.game_start) || (room == room_Game_Over) || (hsp = 0) exit;

//onGround = On_Ground();
var onGroundPrev = onGround;

// Landing after jump
if (onGround && !onGroundPrev)
{
    // Squash + stretch
    xscale = 1.5;
    yscale = 0.5;
}

//Spawn Dust Particles If On The Ground
if (place_meeting(x, y + 1, obj_Wall_One))
{
    for (var i = 0; i < 4; i++)
        instance_create(random_range(bbox_left, bbox_right), bbox_bottom, obj_Dust);
}
//Spawn Dust Particles If On The Ceiling
if (place_meeting(x, y - 1, obj_Wall_One))
{
    for (var i = 0; i < 4; i++)
        instance_create(random_range(bbox_left, bbox_right), bbox_top, obj_Dust);
}


