/// @description  Movement

// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kCharSwitchNext, kCharSwitchBack;

kLeft        = keyboard_check(vk_left)           || gamepad_axis_value(0, gp_axislh) < -0.40;
kRight       = keyboard_check(vk_right)          || gamepad_axis_value(0, gp_axislh) >  0.40;
kUp          = keyboard_check(vk_up)             || gamepad_axis_value(0, gp_axislv) < -0.40;
kDown        = keyboard_check(vk_down)           || gamepad_axis_value(0, gp_axislv) >  0.75; // Test new values

kJump        = keyboard_check_pressed(vk_space)  || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);

kCharSwitchNext  = keyboard_check(ord("Q"))      || gamepad_button_check_pressed(0, gp_shoulderr);
kCharSwitchBack  = keyboard_check(ord("E"))      || gamepad_button_check_pressed(0, gp_shoulderl);

// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
var tempAccel, tempFric;

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
    state  = RUN;
    
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, -vxMax, tempAccel);
// Right
} else if (kRight && !kLeft && !sticking) {
    facing = 1;
    state  = RUN;
    
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, vxMax, tempAccel);
}

// Friction
if (!kRight && !kLeft) {
    vx    = Approach(vx, 0, tempFric);
    state = IDLE;
} 

// Wall jump
if (kJump && cLeft && !onGround) {   
    xscale = 0.5;
    yscale = 1.5;
                    
    for (var i = 0; i < 4; i++)
        instance_create(bbox_left, random_range(bbox_top, bbox_bottom), oFxDust);
                 
    // Wall jump is different when pushing off/towards the wall        
    if (kLeft) {
        vx = jumpHeight * .25;
        vy = -jumpHeight * 1.1;
    } else {
        //vx = vxMax;    
        vx = jumpHeight * .25;
        vy = -jumpHeight * 1.1;
    }  
} else if (kJump && cRight && !onGround) {   
    xscale = 0.5;
    yscale = 1.5;

    for (var i = 0; i < 4; i++)
        instance_create(bbox_right, random_range(bbox_top, bbox_bottom), oFxDust);
                               
    // Wall jump is different when pushing off/towards the wall  
    if (kRight) {
        vx = -jumpHeight * .25;
        vy = -jumpHeight * 1.1;
    } else {
        //vx = -vxMax;  
        vx = -jumpHeight * .25;  
        vy = -jumpHeight * 1.1;
    }  
}

// Jump 
if (kJump) && (onGround) {
    // THIS LINE HAS BEEN EDITED TO ALLOW FOR MULTI JUMPS 
    if (1) {//onGround) {
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
        }
    }
// Variable jumping
} else if (kJumpRelease) { 
    if (vy < 0)
        vy *= 0.25;
}

// Jump state check
if (!onGround) {
    state = JUMP;
    
    if (cLeft)
        facing = 1;
    if (cRight)
        facing = -1;
}



