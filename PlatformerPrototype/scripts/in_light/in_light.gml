/// @function					in_light(instance);
/// @description				Helper script. Check if a caster instance is actually within the light source
/// @param {real}	instance	ID of the instance to check if within the lightsource

// Init temp vars
var left = 1000000;
var right = -1000000;
var top = 1000000;
var bottom = -1000000

// Loop through the shadow caster vertices
for (var i = 0; i < aura_shadow_points; i++;)
{
if x + aura_shadow_x[i] < left		{left = x + aura_shadow_x[i];}
if x + aura_shadow_x[i] > right		{right = x + aura_shadow_x[i];}
if y + aura_shadow_y[i] > bottom	{bottom = y + aura_shadow_y[i];}
if y + aura_shadow_y[i] < top		{top = y + aura_shadow_y[i];}
}

if !rectangle_in_circle(left, top, right, bottom, argument0.x, argument0.y, argument0.aura_light_radius)
    {
    return false;
    }
else return true;
