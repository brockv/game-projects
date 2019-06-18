/// @description SwitchPrevShape();

// Find the next shape to change into
switch (sprite_index) {
  case (sRectangle):
       // Make sure there is room to change shapes
       if collision_rectangle(x - 31, y - 1, x + 31, y - 16, oParSolid, false, true) exit; 
       
       // Change sprite and recalculate shadow points
       sprite_index = sFlat;
       UpdateShadowPoints();
      
       // Update stats to reflect new shape
       UpdateStats();
       break;
 
  case (sSquare):
       // Make sure there is room to change shapes
       if collision_rectangle(x - 15, y - 1, x + 15, y - 48, oParSolid, false, true) exit;
       
       // Change sprite and recalculate shadow points
       sprite_index = sRectangle;
       UpdateShadowPoints();

       // Update stats to reflect new shape
       UpdateStats();
       break;
 
  case (sTall):
       // Make sure there is room to change shapes   
       if collision_rectangle(x - 15, y - 1, x + 15, y - 32, oParSolid, false, true) exit;
       
       // Change sprite and recalculate shadow points
       sprite_index = sSquare;
       UpdateShadowPoints();

       // Update stats to reflect new shape
       UpdateStats();
       break;
 
  case (sFlat):
       // Make sure there is room to change shapes
       if collision_rectangle(x - 7, y - 1, x + 7, y - 64, oParSolid, false, true) exit;
       
       // Change sprite and recalculate shadow points
       sprite_index = sTall;
       UpdateShadowPoints();
       
       // Update stats to reflect new shape
       UpdateStats();
       
       break;
 
  default:
 
      break;
}
