/// @description  ChangingShapes();

GetInput();

// Apply the correct form of acceleration and friction
if (onGround) { 
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
} 

// Slow to a stop
//vx    = Approach(vx, 0, tempFric)
h = Approach(h, 0, tempFric);

// Handle gravity
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

/*
if (!onGround) {
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax * 0.33, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
    }
}
*/

// Confirm / Cancel changing shapes
if (kAccept) {

   // Update our current sprite and remove a charge
   changingShapes = false;
   prevShape      = sprite_index;
   switchCharges -= 1;
   state          = Movement;
   audio_play_sound(snd_ChangeShapes, 0, false);
   
} else if (kCancel) {
   // Revert sprite and reset shadow points
   sprite_index = prevShape;
   UpdateStats();
   UpdateShadowPoints();
   changingShapes = false;
   state          = Movement;
   audio_play_sound(snd_Error, 0, false);
   
}
