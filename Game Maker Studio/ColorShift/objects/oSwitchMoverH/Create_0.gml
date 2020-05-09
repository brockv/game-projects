/// @description  Create shadow casting surfaces
//Aura_Shadow_Caster_Box_Init();

var xw = sprite_width / 2;
var yh = sprite_height / 2;
Aura_Shadow_Caster_Poly_Init();
Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);

/// Initialize variables.
image_speed = 0;

// Set initial speed in custom create event in room editor
vx = 0;
vy = 0;

cx = 0;
cy = 0;

playerAbove = place_meeting(x, y - 1, oParEntity);

// Move speed when player is above
spd = 1;

xscale = 1;
yscale = 1;

