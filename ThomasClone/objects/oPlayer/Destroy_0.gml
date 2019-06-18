/// @description  Explode and shake the screen on death.

oGame.shake = random_range(-20, 20);

// Explosion
audio_play_sound(snd_Death, 0, false);
AssemblePixels(x, y - sprite_height, oFxExplode, prevShape, 100, 4, image_blend, false);

