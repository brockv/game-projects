/// @description  Floating effect / update depth.

// Floating
y = anchorY + sin(timer * frequency) * amplitude;
timer++;

// Depth
depth = depth;

/// Transition to next room.

// DEMO ONLY
if place_meeting(x, y - (sprite_height / 2), oPlayer) {
   
   if room != rm_DemoEight {
      
      room_goto_next();
   
   } else game_end();
}

