/// @description Fade out alarm

// Decrement image alpha
image_alpha -= 0.1;

// Reset the fade alarm if image alpha is greater than 0
if (image_alpha > 0) alarm[0] = 1; 

