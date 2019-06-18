/// @description Fade logic

// Decrease alpha value

fade_in_alpha -= 0.1;

// Destroy fade object when alpha reaches 0
if (fade_in_alpha <= 0) instance_destroy();