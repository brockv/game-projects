// Draw sprite depending on player state
switch (state) {
    case IDLE: 
        image_speed = 0.1;
        sprite_index = sPlayerIdle;
    break;
    
    case RUN: 
        image_speed = 0.25; 
        sprite_index = sPlayerRun;
    break;
    
    case JUMP:
        // Mid jump   
        if (!(place_meeting(x, y + 2, oParSolid) && v != 0) && v >= -1.0 && v <= 1.0) {  
            sprite_index = sPlayerJumpM;  
       } else { 
            // Rise + fall
            if (v <= 0)  
                sprite_index = sPlayerJumpU;  
            else
                sprite_index = sPlayerJumpD;
        }
         
        // When against a wall   
        if (cRight || cLeft) && rope == -1
            sprite_index = sPlayerSlide;  
    break;
}

// Draw player
if (canGetHurt || blink) {
    if (onGround)
        draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, 0, c_white, image_alpha);    
    else
        draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);
}

// BLINK WHEN STUNNED
if (blink)
    blink = false;
else
    blink = true;

