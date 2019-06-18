/// @description Move particle

// Move sprite up
x += player_dir;
y -= random_spd;

// Rotate sprite
rotation += rotation_dir;

// Reduce alpha
alpha -= 0.05;

// Destroy the particle when the alpha is less than or equal to zero
if (alpha <= 0) instance_destroy();