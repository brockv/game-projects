/// @description UpdateStats();

// Update the players stats to reflect their current shape
with (oPlayer) {
    if (sprite_index = sRectangle) {
        groundAccel = 1.00;
        groundFric  = 2.00;
        airAccel    = 0.50;
        airFric     = 0.05;
        vxMax       = 7.50;
        vyMax       = 16.0;
        jumpHeight  = 9.00;
        gravNorm    = 0.66;
        gravSlide   = 0.33;
        
        clingTime   = 4.0;
        jumpSound   = snd_RectangleJump;
    } else if (sprite_index = sSquare) {
        groundAccel = 1.00;
        groundFric  = 2.00;
        airAccel    = 0.50;
        airFric     = 0.05;
        vxMax       = 7.50;
        vyMax       = 16.0;
        jumpHeight  = 6.00;
        gravNorm    = 0.66;
        gravSlide   = 0.33; 
        
        clingTime   = 4.0;
        jumpSound   = snd_SquareJump;
    } else if (sprite_index = sTall) {
        groundAccel = 1.00;
        groundFric  = 2.00;
        airAccel    = 0.50;
        airFric     = 0.05;
        vxMax       = 7.50;
        vyMax       = 16.0;
        jumpHeight  = 14.00;
        gravNorm    = 0.66;
        gravSlide   = 0.33; 
        
        clingTime   = 4.0;
        jumpSound   = snd_TallJump;
    } else if (sprite_index = sFlat) {
        groundAccel = 1.00;
        groundFric  = 2.00;
        airAccel    = 0.50;
        airFric     = 0.05;
        vxMax       = 7.50;
        vyMax       = 16.0;
        jumpHeight  = 8.00;
        gravNorm    = 0.66;
        gravSlide   = 0.33; 
        
        clingTime   = 4.0;
        jumpSound   = snd_FlatJump;
    }
}
