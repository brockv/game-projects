/// @description  Initialize exploding variables.

image_xscale = 0.002;
image_yscale = 0.002;
alarm[0]     = room_speed*2;
image_blend  = image_blend;

/// Create shadow casting surfaces.

var xw = sprite_width / 2;
var yh = sprite_height / 2;
Aura_Shadow_Caster_Poly_Init();
Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);

