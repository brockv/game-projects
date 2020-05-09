/// @description  Aura_Shadow_Caster_Circle_Init(precision, radius);
/// @param precision
/// @param  radius

// Create a circular shadow caster, with the given precision and size.
// It is assumed that the x/y of the caster instance sprite is centered
// and a precision of 8 is usually fine, but you may need to make it 
// higher for larger sprites.

aura_shadow_points = 0;

var a_prec = argument0;
var a_rad = argument1;
var a_ang = 360 / a_prec;
var a_xx = 0;
var a_yy = 0;

for (var i = 0; i <= 360; i += a_ang;)
{
aura_shadow_x[aura_shadow_points] = lengthdir_x(a_rad, i);
aura_shadow_y[aura_shadow_points] = lengthdir_y(a_rad, i);
aura_shadow_points++;
}
