// Create shadow casting polygon instance.

// First call the Init script...

Aura_Shadow_Caster_Poly_Init();

// Now add all the points of the polygon....

Aura_Shadow_Caster_Poly_Add_Point(0, -(sprite_height / 2));
Aura_Shadow_Caster_Poly_Add_Point(sprite_width / 2, sprite_height / 2);
Aura_Shadow_Caster_Poly_Add_Point(0, 0);
Aura_Shadow_Caster_Poly_Add_Point(-(sprite_width / 2), sprite_height / 2);
Aura_Shadow_Caster_Poly_Add_Point(0, -(sprite_height / 2));

// Note that polygons can be concave OR convex! And that 
// all points should be defined in a CLOCKWISE direction.

// The following is for the DEMO and can be removed

direction = choose(0, 90, 180, 270);
speed = 1 + irandom(3);
alarm[0] = room_speed;

