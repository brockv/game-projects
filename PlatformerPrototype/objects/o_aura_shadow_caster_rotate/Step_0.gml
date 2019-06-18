// Rotate the sprite

image_angle++;

// Use the Rotate script
Aura_Shadow_Caster_Rotate(image_angle);

// You can manually rotate the shadow caster too...
//  By rotate the shadow mesh using the arrays we initialised in the create event
/*
var num = aura_shadow_points;

Aura_Shadow_Caster_Poly_Init();
for (var i = 0; i < num; i++)
{
Aura_Shadow_Caster_Poly_Add_Point(lengthdir_x(a_dist[i], a_dir[i] + image_angle), lengthdir_y(a_dist[i], a_dir[i] + image_angle));
}
*/

