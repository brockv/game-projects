/// @description  Movement.

script_execute(state);

/*
// Input //////////////////////////////////////////////////////////////////////

kLeft        = keyboard_check(vk_left);
kRight       = keyboard_check(vk_right);
kUp          = keyboard_check(vk_up);
kDown        = keyboard_check(vk_down);
kJump        = keyboard_check_pressed(ord('Z'));
kJumpRelease = keyboard_check_released(ord('Z'));

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
    state = JUMP;
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
    state = IDLE;    
       
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
    
// ROPE STUFF /////////////////////////////////////////////////////////////////
if (instance_place(x, y, oRopeSegment)) {
    if (instance_place(x, y, oRopeSegment).parent != -1) {
        if (canGrabRope && !rope) {
            with (instance_place(x, y, oRopeSegment))
                phy_linear_velocity_x = other.h * 75;
            
            // Grab rope
            rope  = instance_nearest(x, y, oRopeSegment).id;
            
            // Stop player movement
            h = 0;
            v = 0;
        }
    }
}

if (rope) {
    // Keep player in rope position
    with (rope) {
        other.x = phy_position_x - other.facing * 3;
        other.y = phy_position_y - 8 + other.yrope;
    }
    
    // Push out of wall if collision due to rope position
    if (rope) {
        if (cRight) {
            facing = 1;
            
            while(place_meeting(x, y, oParSolid)) {
                --rope.phy_position_x;
                x = rope.phy_position_x;
            }
        }
        if (cLeft) {
            facing = -1;
            
            while(place_meeting(x, y, oParSolid)) {
                ++rope.phy_position_x;
                x = rope.phy_position_x;
            }
        }    
    }
    
    // Jump off of rope
    if (kJump) {
        // Stretch sprite 
        xscale = 0.66;
        yscale = 1.33;
        
        // Jump off rope
        v = -jumpHeight;
        h = maxH * facing;
        state = JUMP;
        
        // Reset rope
        rope  = -1;
        yrope =  8; 
        
        // Don't grab another rope for a few frames
        alarm[1] = 8;
        canGrabRope = false;
    }
    
    // Move along rope
    if (kUp && !kDown) { 
        // Move up segment
        if (yrope > 0) {
            // Don't climb into ceiling
            if (!place_meeting(x, y - 2, oParSolid))
                yrope = Approach(yrope, 0, 3);
        } else {
            // Switch segments
            if (rope.parent != -1) {
                rope  = rope.parent;
                yrope = 8;
            }
        } 
    }
    
    // Move along rope
    if (kDown && !kUp) { 
        // Move up segment
        if (yrope < 8) {
            // Don't climb into ceiling
            if (!place_meeting(x, y + 2, oParSolid))
                yrope = Approach(yrope, 8, 3);
        } else {
            // Switch segments
            with (oRopeSegment) {
                if (parent == other.rope) {
                    other.rope = self.id;
                    other.yrope = 0;
                }   
            }
            
            // Drop off rope
            if (yrope == 8) {
                // Reset rope
                rope  = -1;
                yrope =  8;
                
                // Don't grab another rope for a few frames
                alarm[1] = 8;
                canGrabRope = false; 
                
                // Reset fall speed
                h = 0;
                v = 0;
            }
        } 
    }
}

///////////////////////////////////////////////////////////////////////////////

/* */
/// Test liquid contact.
/*
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

/* */
/*  */
