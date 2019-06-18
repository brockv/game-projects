/// @description Fade control alarm

// Update the player's light with the shrinking radius
Aura_Light_Set_Radius(o_aura_character_light, radius, true);

// Decrement radius and reset the alarm if the current radius size is greater than the minimum radius size
radius--;
if (radius > minimum_radius) alarm[10] = 4;