if (!init) {
    // Spawn water over sprite mask
    liquid = liquid_create(x, y, sprite_width, sprite_height, sprite_width / 16, 3, 1, 0.5, 1, 0.5, 4, 1);
    
    with (liquid) {
        move       = other.move;
        moveSpd    = other.moveSpd;
    }
    
    if (foreground)
        depth = -1;
    
    init = true;
}

