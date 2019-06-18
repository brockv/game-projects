/// @description  Destroy the player object.

if instance_exists(oPlayer) {
   with (oPlayer) {
        instance_destroy();
   }
}

