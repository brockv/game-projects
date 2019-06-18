/// @description  Destroy player.

// Destroy the player object if their color doesn't match the platform

with (oPlayer) {
     if image_index = 1 {
         // Above platform
         if (place_meeting(x, y + 1, oBlockBlack) || place_meeting(x, y + 1, oParJumpThru)) {
             instance_destroy();
         // Wall-slide
         } else if !onGround && (cLeft || cRight) {
             instance_destroy();
         }
   }
}

