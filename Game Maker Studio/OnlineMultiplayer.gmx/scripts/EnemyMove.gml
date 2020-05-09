/// EnemyMove();

globalvar targetsNumber;
targetsNumber = instance_number(oPlayer);
target = noone;

SelectTarget();



if (targetsNumber <= 0) {
   EnemyFreeMove();
   target = noone;
} else {
   if (target != noone) {
      if (distance_to_object(target) > chaseDist) {
         // Reset state
         if (state = "chase") {
            state = choose("walk", "idle");
         }
         EnemyFreeMove();
         target = noone;
      } else if (target.isAlive && abs(target.y - y) < 8) {
         ChaseTarget(target);
      } else {
         if (state = "chase") {
            state = choose("walk", "idle");
         }
         EnemyFreeMove();
         target = noone;
      }
   } else {
      // Reset state
      if (state = "chase") {
         state = choose("walk", "idle");
      }
      EnemyFreeMove();
   }
}

// Sprite control
if (state = "walk") {
   if (onGround) {
      image_speed = 0.1;
      sprite_index = sLizard;
   } else {
      image_speed = 0;
      image_index = 1;
      sprite_index = sLizard;
   }
}


