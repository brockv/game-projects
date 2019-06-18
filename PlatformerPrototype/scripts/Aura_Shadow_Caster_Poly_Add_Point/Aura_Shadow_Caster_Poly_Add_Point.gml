/// @function			Aura_Shadow_Caster_Poly_Add_Point(x, y);
/// @description		Add points to a polygon shadow caster
/// @param {real}	x	The x position for the shadow caster in the room
/// @param {real}	y	The y position for the shadow caster in the room

// Add a point to the shadow caster polygon in CLOCKWISE order
aura_shadow_x[aura_shadow_points] = argument0;
aura_shadow_y[aura_shadow_points] = argument1;
aura_shadow_xylen[aura_shadow_points] = point_distance(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);
aura_shadow_xydir[aura_shadow_points] = point_direction(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);

aura_shadow_points++;
