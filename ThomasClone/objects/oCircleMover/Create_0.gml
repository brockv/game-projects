/// @description  Create shadow casting surfaces
//Aura_Shadow_Caster_Box_Init();

var xw = sprite_width / 2;
var yh = sprite_height / 2;
Aura_Shadow_Caster_Poly_Init();
Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);

/// Initialize variables
vx = 0;
vy = 0;

cx = 0;
cy = 0;

radius = 10;

// Set both of these (same)
speed  = 2;
spd    = 2;

