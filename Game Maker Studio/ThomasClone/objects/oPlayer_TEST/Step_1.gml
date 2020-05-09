/// @description  Check if you were onGround previous frame.

var temp;

// Check if you were onGround previous frame
temp = onGround;

onGround = OnGround();
platformTarget = instance_place(x, y + 1, oParSolid);

// Squash sprite during jump landing
if (!temp && onGround) {
    if (v >= 0) {        
        yscale = 0.66;
        xscale = 1.33;  
    }
    
    // Dust particles
    if (!slqd && !lqd) {
       for (var i = 0; i < 6; i++)
           instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
    }
}

// Update relative collision
cLeft  = place_meeting(x - 1, y, oParSolid);//oBlock); 
cRight = place_meeting(x + 1, y, oParSolid);//oBlock); 
cAbove = place_meeting(x, y - 1, oParSolid);//oBlock);

