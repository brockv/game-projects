/// @description  Aura_Shadow_Caster_Box_Init();

// Create a box shaped shadow caster based on the current sprite
// This takes into consideration any scaling done in the room editor,
// or using the image_x/yscale (as long as they have been set 
// previously to calling this script).

// Number of shadow points
aura_shadow_points = 4;

// Add the points to the shadow caster array
aura_shadow_x[0] = x - bbox_left;
aura_shadow_y[0] = y - bbox_top;

aura_shadow_x[1] = bbox_right - x;
aura_shadow_y[1] = y - bbox_top;

aura_shadow_x[2] = bbox_right - x;
aura_shadow_y[2] = bbox_bottom - y;

aura_shadow_x[3] = x - bbox_left;
aura_shadow_y[3] = bbox_bottom - y;
