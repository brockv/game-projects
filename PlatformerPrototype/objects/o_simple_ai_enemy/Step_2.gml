/// @description Store old states.

event_inherited();

var old_ground = ground;
//var old_cling  = (cling_left || cling_right);
old_move_x     = move_x;

#region // Running particle effects

if (ground && !old_ground) {
    repeat(5) {
        //var _xx = x + random_range(5, -5);
        //var _yy = bbox_bottom - random(3);
        // Particles
        for (var _i = 0; _i < 1; ++_i) {
            with (instance_create_layer(x + random_range(-8, 8), bbox_bottom, "enemy", o_dust_effect)) {
                direction = random_range(-45, 45);
			}
		}
    }
	
	// Set bounce effect
    var _bounce = 2;
    xscale = 1 * _bounce;
    yscale = 1 / _bounce;
    fallthrough_timer = 0;
}

#endregion

#region // Get target's location

// Check for the player
if (instance_exists(o_player)) {
   // Player exists and is in range -- move towards it
   if (distance_to_point(o_player.x, o_player.y) < 100) {
   
      target_x = o_player.x;
      target_y = o_player.y;
      
   // Player exists and is *not* in range -- move to a random spot nearby
   } else {
   
      //alarm[0] = random_range(10, 20);
      target_x = x + random_range(-500, 500);
      target_y = y + random_range(-500, 500);
      
   }
// No player object -- move to a random spot nearby
} else {

   //alarm[0] = random_range(10, 20);
   target_x = x; //+ random_range(-500, 500);
   target_y = y; //+ random_range(-500, 500);
   
}

#endregion

#region // Pathfinder step

pathfinder_step();

#endregion

#region // Jumping particle effect

if (move_jump && ground) {
    repeat(5) {
        //var _xx = x + random_range(5, -5);
        //var _yy = bbox_bottom - random(3);
        // Particles
        for (var _i = 0; _i < 1; ++_i) {
            with (instance_create_layer(x + random_range(-8, 8), bbox_bottom, "enemy", o_dust_effect)) {
                direction = random_range(-45, 45);
			}
		}
    }
    var _bounce = 2;
    xscale     = 1 / _bounce;
    yscale     = 1 * _bounce;
}

var _k = 0.2;
xscale = smooth_approach(xscale, 1, _k);
yscale = smooth_approach(yscale, 1, _k);

#endregion


/// Death.

// HP reached 0
//if (hp <= 0) {
//   instance_destroy();
//}

