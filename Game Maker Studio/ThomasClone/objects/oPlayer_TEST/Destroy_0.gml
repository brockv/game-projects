/// @description  Explode and shake the screen on death.

oGame.shake = random_range(-20, 20);

// Explosion
audio_play_sound(snd_Death, 0, false);
AssemblePixels(x, y - sprite_height, oFxExplode, prevShape, 100, 4, image_blend, false);

/*
with (oCamera) {
    alarm[0] = 8;
    screenShake = true;
}

var i;
for (i = 0; i < 8; ++i)
    instance_create(x, y, oBlood);

/* */
/*  */
