/// @description SwitchNextCharacter();

// Cycle forwards through the characters
show_debug_message("Attempting to find next character...");

if (object_exists(oRectangle) && oRectangle.active = true) {
   if (object_exists(oSquare)) {
      oRectangle.active = false;
      oSquare.active    = true;
   } else if (object_exists(oTall)) {
      oRectangle.active = false;
      oTall.active      = true;
   } else if (object_exists(oFlat)) {
      oRectangle.active = false;
      oFlat.active      = true;
   } else {
      show_message("Couldn't find an object to switch to.");
      exit;
   }
} else if (object_exists(oSquare) && oSquare.active = true) {
   if (object_exists(oTall)) {
      oSquare.active    = false;
      oTall.active      = true;
   } else if (object_exists(oFlat)) {
      oSquare.active    = false;
      oFlat.active      = true;
   } else if (object_exists(oRectangle)) {
      oSquare.active    = false;
      oRectangle.active = true;
   } else {
      show_message("Couldn't find an object to switch to.");
      exit;
   }
} else if (object_exists(oTall) && oTall.active = true) {
   if (object_exists(oFlat)) {
      oTall.active      = false;
      oFlat.active      = true;
   } else if (object_exists(oRectangle)) {
      oTall.active      = false;
      oRectangle.active = true;
   } else if (object_exists(oSquare)) {
      oTall.active      = false;
      oSquare.active    = true;
   } else {
      show_message("Couldn't find an object to switch to.");
      exit;
   }
} else if (object_exists(oFlat) && oFlat.active = true) {
   if (object_exists(oRectangle)) {
      oFlat.active      = false;
      oRectangle.active = true;
   } else if (object_exists(oSquare)) {
      oFlat.active      = false;
      oSquare.active    = true;
   } else if (object_exists(oTall)) {
      oFlat.active      = false;
      oTall.active      = true;
   } else {
      show_message("Couldn't find an object to switch to.");
      exit;
   }
}
