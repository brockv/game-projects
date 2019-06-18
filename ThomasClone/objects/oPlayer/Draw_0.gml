/// @description  Draw the sprite.

// Dim the sprite if changing shapes
if (changingShapes) {
   draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, 0.5);
} else {
   draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);
}


