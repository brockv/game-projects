/// EnemyFreeMove();

image_xscale = dir;

if (changeState) {
   changeState = false;
   alarm[0] = room_speed * choose(1, 2, 3);
}


if (state = "walk") {
   if (place_free(x + (moveSpeed * dir), y)) {
      x += (moveSpeed * dir);
   } else {
      dir = -dir;
   }
}

if (state = "idle") {
   image_speed = 0;
   image_index = 0;
   sprite_index = sLizard;
}

if (state = "jump") {
   if (onGround) {
      vspeed -= 8;
      onGround = false;
      state = choose("walk", "idle", "jump");
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


