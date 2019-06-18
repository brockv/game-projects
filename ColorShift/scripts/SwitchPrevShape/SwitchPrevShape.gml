/// @description SwitchPrevShape();

// Find the next shape to change into
switch (sprite_index) {
  case (sRectangle):
       // Make sure there is room to change shapes
       if collision_line(x, y -  (sprite_height / 2), x - 32, y -  (sprite_height / 2), oParSolid, false, true) ||
          collision_line(x, y -  (sprite_height / 2), x + 32, y -  (sprite_height / 2), oParSolid, false, true) exit;
       // Change sprite and recalculate shadow points
       sprite_index = sFlat;
       var xw = sprite_width / 2;
       var yh = sprite_height / 2;
       Aura_Shadow_Caster_Poly_Init();
       Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);
       
       // Update stats to reflect new shape
       UpdateStats();
       break;
 
  case (sSquare):
       // Make sure there is room to change shapes
       if collision_line(x, y -  (sprite_height / 2), x, y - 48, oParSolid, false, true) exit;
       // Change sprite and recalculate shadow points
       sprite_index = sRectangle;
       var xw = sprite_width / 2;
       var yh = sprite_height / 2;
       Aura_Shadow_Caster_Poly_Init();
       Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);
       
       // Update stats to reflect new shape
       UpdateStats();
       break;
 
  case (sTall):
       // Make sure there is room to change shapes
       if collision_line(x, y - (sprite_height / 2), x - 16, y -  (sprite_height / 2), oParSolid, false, true) ||
          collision_line(x, y -  (sprite_height / 2), x + 16, y -  (sprite_height / 2), oParSolid, false, true) exit;
       // Change sprite and recalculate shadow points
       sprite_index = sSquare;
       var xw = sprite_width / 2;
       var yh = sprite_height / 2;
       Aura_Shadow_Caster_Poly_Init();
       Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);
       
       // Update stats to reflect new shape
       UpdateStats();
       break;
 
  case (sFlat):
       // Make sure there is room to change shapes
       if collision_line(x, y -  (sprite_height / 2), x, y - 48, oParSolid, false, true) exit;
       // Change sprite and recalculate shadow points
       sprite_index = sTall;
       var xw = sprite_width / 2;
       var yh = sprite_height / 2;
       Aura_Shadow_Caster_Poly_Init();
       Aura_Shadow_Caster_Poly_Add_Point(-xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, -yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(xw, yh - yh);
       Aura_Shadow_Caster_Poly_Add_Point(-xw, yh - yh);
       
       // Update stats to reflect new shape
       UpdateStats();
       
       break;
 
  default:
 
      break;
}
