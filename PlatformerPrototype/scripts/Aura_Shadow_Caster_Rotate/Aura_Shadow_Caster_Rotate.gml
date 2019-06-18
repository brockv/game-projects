/// @function				Aura_Shadow_Caster_Rotate(angle);
/// @description			Rotate a shadow caster by a given amount
/// @param {real}	angle	The angle to rotate the shadow by

for (var i = 0; i < aura_shadow_points; i++;)
{
aura_shadow_x[i] = lengthdir_x(aura_shadow_xylen[i], aura_shadow_xydir[i] + argument0);
aura_shadow_y[i] = lengthdir_y(aura_shadow_xylen[i], aura_shadow_xydir[i] + argument0);
}