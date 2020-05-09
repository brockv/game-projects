/// ChaseTarget(target);

if (x > target.x) {
   dir = -abs(image_xscale);
} else {
   dir = abs(image_xscale);
}

image_xscale = dir;

var dist = distance_to_object(target);

// Move towards the target
if (dist > attackDist) {
   if (target.isAlive) {
       if (place_free(x + (moveSpeed * dir), y)) {
          x += moveSpeed * dir;
          sprite_index = sLizard;
          image_speed = 0.2;
       }
   } else {
      //SelectTarget();
      state = choose("walk", "idle");
      EnemyFreeMove();
   }
} else {
   // Attack the target
   if ((abs(y - target.y) < 10) && target.isAlive) {
      if (canAttack) {
          //state = "chase";
          canAttack = false;
          alarm[1] = 2 * room_speed;
          var bullet = instance_create(x, y - (sprite_height / 2), oLizardBullet);
          bullet.speed = 2;
          var bDir = 0;
          if (dir < 0) {
             bDir = 180;
          }
          bullet.direction = bDir
          bullet.ID = ID;
          bullet.dmg = damage
          bullet.image_xscale = image_xscale;
          sprite_index = sLizardShoot;
       } else {
          //sprite_index = sLizard;
       }
   } else {
      state = choose("walk", "idle");
      EnemyFreeMove();
      target = noone;
      sprite_index = sLizard;
   }
}
