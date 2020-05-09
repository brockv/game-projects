/// @description Movement();

GetInput();

///////////////////////////////////////////////////////////////////////////////

// Which form of accel/fric to apply
if (onGround) {
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
}

// Stick to wall //////////////////////////////////////////////////////////////
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
}   

// Cling to wall
if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true; 
    canStick = false;       
}
///////////////////////////////////////////////////////////////////////////////

// Gravity ////////////////////////////////////////////////////////////////////
if (!onGround) {
    state = Movement;
    if ((cLeft || cRight) && v >= 0) {
        // Wall slide
        v = Approach(v, maxV, gravSlide);
    } else {
        
        // Fall normally
        if (v < 0)
            v = Approach(v, maxV, gravRise);
        else
            v = Approach(v, maxV, gravFall);
    }
}
///////////////////////////////////////////////////////////////////////////////

// Left 
if (kLeft && !kRight && !sticking) {
    facing = LEFT;

    // Apply acceleration left
    if (h > 0)
        h = Approach(h, 0, tempFric);   
        h = Approach(h, -maxH, tempAccel);

}

// Right 
if (kRight && !kLeft && !sticking) {
    facing = RIGHT;

    // Apply acceleration right
    if (h < 0)
        h = Approach(h, 0, tempFric);   
        h = Approach(h, maxH, tempAccel);

}

// Friction
if (!kRight && !kLeft)
    h = Approach(h, 0, tempFric);

if (onGround && h == 0)
    state = Idle;

        
// Wall jump
if (kJump && cLeft && !onGround) {
    // Stretch sprite
    xscale = 0.66;
    yscale = 1.33;            
    
    // Wall jump is different when pushing off/towards the wall        
    if (kLeft) {
        v = -jumpHeight * 1.1;
        h = jumpHeight * .75  * 1.2;
    } else {
        v = -jumpHeight * 1.1;
        h = maxH;
    }  
}

if (kJump && cRight && !onGround) {
    // Stretch sprite
    xscale = 0.66;
    yscale = 1.33;              
        
    // Wall jump is different when pushing off/towards the wall  
    if (kRight) {
        v = -jumpHeight * 1.1;
        h = -jumpHeight * .75 * 1.2;
    } else {
        v = -jumpHeight * 1.1;
        h = -maxH;
    }  
}
  
// Jump
if (kJump && onGround) {
    if (onGround || (!cRight && !cLeft)) {
        // Stretch sprite 
        xscale = 0.66;
        yscale = 1.33;
        
        v = -jumpHeight;
        state = JUMP;
        
        // Hop OFF floater
        if (instance_place(x, y + 1, oFloater)) {
            // Move nearest wave
            with (instance_place(x, y + 1, oFloater)) {
                var spd = -other.v; // Player v
                liquid_apply_force_x(instance_nearest_bbox(oWater), x + sprite_width * 0.5, -(spd * 0.25));
            }
        }
    }
} else {
    // Variable hop
    if (kJumpRelease) {
        if (v < 0)
            v *= 0.25; 
    }
}

// Swap facing on walls
if (cLeft)
    facing = RIGHT;
if (cRight)
    facing = LEFT;
    
/// Test liquid contact.

    // Find closest liquid box
    var obj  = instance_nearest_bbox(oWater);
    
    // Collide with liquid
    lqd  = place_meeting(x, y, obj) && !collision_rectangle(bbox_left, y, bbox_right, y + 64, oFloater, true, true) && !place_meeting(x, y, oShallowWaterMask);
    slqd = place_meeting(x, y, oShallowWaterMask); 
    
    // Jump in water
    if (!slqd) {
    if (lqd != prvlqd) {
            // Realise current liquid state
            prvlqd = lqd;
            
            // Apply manipulation to liquid
            liquid_apply_force_x(obj, x, v * 0.25);
            liquid_splash_create(obj, x, liquid_point_y(obj, x), -abs(v * 0.25), 16, 4, 4, 0.25, c_white, 0.5, bm_normal);
            
            // Speed up on liquid exit / slowdown on entrace
            if (!lqd) v *= 2.5; else v *= 0.25; 
            
        }
    }
    
    // Jump in shallow water
    if (slqd != sprvlqd)
    {
        // Realise current liquid state
        sprvlqd = slqd;
    }    
    
    // Walk in shallow water
    if (slqd) {
        if (h != 0) {
            liquid_apply_force_x(obj, x, h * 0.2);
            if (--splashdelay <= 0) {
                splashdelay = 6;
                liquid_splash_create(obj, x, liquid_point_y(obj, x), -abs(h * 0.1), 4, 4, 4, 0.25, c_white, 0.5, bm_normal); 
            }       
        }
        
        if (v != 0) {
            liquid_apply_force_x(obj, x, v * 0.25);
            liquid_splash_create(obj, x, liquid_point_y(obj, x), -abs(v * 0.2), 4, 4, 4, 0.25, c_white, 0.5, bm_normal);        
        }    
    }
    
    // Manipulate speeds in liquid
    if (!slqd && lqd)
    {
        m = waterM;
        
        // Acceleration + Friction
        groundAccel = 1.0  * m;
        groundFric  = 2.0  * m;
        airAccel    = 0.75 * m;
        airFric     = 0.10 * m;
        
        // Max movement speeds
        maxH        = 5.5  * m;
        maxV        = 9.0  * m;
        
        jumpHeight  = 7.0  * m;
        gravRise    = 0.5  * m;
        gravFall    = 0.5  * m;
        gravSlide   = 0.25 * m;
    }
    else
    {
        m = normalM;
        
        // Acceleration + friction
        groundAccel = 1.0  * m;
        groundFric  = 2.0  * m;
        airAccel    = 0.75 * m;
        airFric     = 0.10 * m;
        
        // Max movement speeds
        maxH        = 5.5  * m;
        maxV        = 9.0  * m;
        
        jumpHeight  = 7.0  * m;
        gravRise    = 0.5  * m;
        gravFall    = 0.5  * m;
        gravSlide   = 0.25 * m;
    }
    
///////////////////////////////////////////////////////////////////////////////


// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
if (onGround) { 
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
} 
 
// Wall cling to avoid accidental push-off
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
} else if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true; 
    canStick = false;       
}

// Handle gravity
if (!onGround) {
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax * 0.33, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
    }
}


// Left 
if (kLeft && !kRight && !sticking) {
    facing = -1;
    
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);   
        vx = Approach(vx, -vxMax, tempAccel);
// Right
} else if (kRight && !kLeft && !sticking) {
    facing = 1;
    //state  = RUN;
    
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);   
        vx = Approach(vx, vxMax, tempAccel);
}

// Friction
if (!kRight && !kLeft) {
    vx    = Approach(vx, 0, tempFric);
} 

// Wall jump
if (kJump && cLeft && !onGround) {   
    xscale = 0.5;
    yscale = 1.5;
                    
    for (var i = 0; i < 4; i++)
        instance_create(bbox_left, random_range(bbox_top, bbox_bottom), oFxDust);
                 
    // Wall jump is different when pushing off/towards the wall        
    if (kLeft) {
        if (sprite_index = sTall) {
          vx = jumpHeight * .25;
          vy = -jumpHeight * 1.1 
        } else {
          vx = jumpHeight * .45;
          vy = -jumpHeight * 1.1;
        }
    } else if (kRight) {
        vx = vxMax;    
        vy = -jumpHeight * 1.1;
    } 
    
    audio_play_sound(jumpSound, 0, false);
     
} else if (kJump && cRight && !onGround) {   
    xscale = 0.5;
    yscale = 1.5;

    for (var i = 0; i < 4; i++)
        instance_create(bbox_right, random_range(bbox_top, bbox_bottom), oFxDust);
                               
    // Wall jump is different when pushing off/towards the wall  
    if (kRight) {
        if (sprite_index = sTall) {
          vx = -jumpHeight * .25;
          vy = -jumpHeight * 1.1 
        } else {
          vx = -jumpHeight * .45;
          vy = -jumpHeight * 1.1;
        }
    } else if (kLeft) {
        vx = -vxMax;    
        vy = -jumpHeight * 1.1;
    }
    
    audio_play_sound(jumpSound, 0, false); 
}

// Jump 
if (kJump) {
    // THIS LINE HAS BEEN EDITED TO ALLOW FOR MULTI JUMPS 
    if (1) { //onGround
        // Fall thru platform
        if (kDown) && (place_meeting(x, y + 1, oParJumpThru) && !place_meeting(x, y + 1, oParSolid)) {
                ++y;
        // Normal jump
        } else {
            xscale = 0.5;
            yscale = 1.5;
            
            for (var i = 0; i < 4; i++)
                instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
            
            vy = -jumpHeight;
            audio_play_sound(jumpSound, 0, false);
        }
    }
    
// Variable jumping
} else if (kJumpRelease) { 
    if (vy < 0)
        vy *= 0.25;
}

// Jump state check
if (!onGround) {
    
    if (cLeft)
        facing = 1;
    if (cRight)
        facing = -1;
}
