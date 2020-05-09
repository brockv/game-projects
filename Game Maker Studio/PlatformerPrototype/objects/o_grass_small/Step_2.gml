/// @description Update position

// Only update the position if player/entity has moved away from the grass.
if (distance_to_object(o_player) < 2) exit;

// The springing script costs a lot of cpu power to calculate for every grass object, 
// so only use it if completely necessary, using only a lerp function will get you a lot more fps.
// This will move the grass back to its starting location.
xskew = grass_springing(xskew, 0, 20, 0.9);