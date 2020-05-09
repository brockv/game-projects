/// @description  Camera

// Move the camera with the player
if (instance_exists(oPlayer) && playerActive) {
    // Look in the direction the player is facing, and slightly upward
    cam.xTo = oPlayer.x + oPlayer.facing * hDist;
    cam.yTo = oPlayer.y - vDist;
    
    // When up against a tall wall, look forward slightly and up much further
    if place_meeting(oPlayer.x + oPlayer.facing, oPlayer.y - peek, oParSolid) {
       cam.xTo = oPlayer.x + oPlayer.facing * peek;
       cam.yTo = oPlayer.y - vDist * 3;
    }
    
    // When standing on a ledge, look forward slightly and down much further
    if !place_meeting(oPlayer.x + (oPlayer.facing * peek), oPlayer.y + 1, oParSolid) && !place_meeting(oPlayer.x + (oPlayer.facing * peek), oPlayer.y + peek, oParSolid) && 
       !place_meeting(oPlayer.x + (oPlayer.facing * peek), oPlayer.y + 1, oParJumpThru) && !place_meeting(oPlayer.x + (oPlayer.facing * peek), oPlayer.y + peek, oParJumpThru) && oPlayer.onGround {
       cam.xTo = oPlayer.x + oPlayer.facing * peek;
       cam.yTo = oPlayer.y + vDist * 2;
    }
    
    // Update camera position
    cam.x += (cam.xTo - cam.x) / camSpd;
    cam.y += (cam.yTo - cam.y) / camSpd;
    
    // Update sprite used for peeking
    peek    = (oPlayer.sprite_width / 2) + 1;
} else if (playerActive) {
    
    // Screen shake?
    if (shake > 0.05) {
       cam.x += random_range(-shake, shake);
       cam.y += random_range(-shake, shake);
       shake *= 0.97;
     } else {
       shake = 0;
     }
}

/// Screenshake

/*
var r;

r = 0;

// Screenshake
if (shake) {
    r = choose(-1, 1);
    
    if (r) {
        xcamo = xshake * shakeDist;
        ycamo = 0;
        xshake *= -1;
    } else {
        xcamo = 0;
        ycamo = yshake * shakeDist;    
        yshake *= -1;
    }
// Small screenshake
} else if (babyshake) {
    r = choose(-1, 1);
    
    if (r) {
        xcamo = xshake * shakeDist * 0.5;
        ycamo = 0;
        xshake *= -1;
    } else {
        xcamo = 0;
        ycamo = yshake * shakeDist * 0.5;    
        yshake *= -1;
    }
} else {
    xcamo = 0;
    ycamo = 0;
}

/* */
/*  */
