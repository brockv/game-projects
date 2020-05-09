/// @description  Camera + Assemble Images

// Camera state
shake     = false;
babyshake = false;
xshake    = choose(-1, 1);
yshake    = choose(-1, 1);
shakeDist = 2;

// Camera offset
xcamo = 0;
ycamo = 0;

// Assemble the player object
AssemblePixels(oCamera.x, oCamera.y, oPlayer, sPlayer, 40, 8, image_blend, true);

