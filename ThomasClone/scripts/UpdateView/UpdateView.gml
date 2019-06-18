/// @description UpdateView();

// Position view based on active player.

var xTo, yTo, cDir;

// Single object camera
if (instance_exists(oPlayer)) {
   cDir = point_direction(x, y, oPlayer.x, oPlayer.y);
   xTo = (x + lengthdir_x((distance_to_point(oPlayer.x, oPlayer.y)), cDir));
   yTo = (y + lengthdir_y((distance_to_point(oPlayer.x, oPlayer.x)), cDir));
   
   x += (xTo - x) / 15;
   y += (yTo - y) / 15;
   __view_set( e__VW.XView, 0, -(__view_get( e__VW.WView, 0 ) / 2) + x );
   __view_set( e__VW.YView, 0, -(__view_get( e__VW.HView, 0 ) / 2) + y );
}

/*
// Multiple object camera
if (instance_exists(oRectangle)) && (oRectangle.active = true) {
   cDir = point_direction(x, y, oRectangle.x, oRectangle.y);
   xTo = (x + lengthdir_x((distance_to_point(oRectangle.x, oRectangle.y)), cDir));
   yTo = (y + lengthdir_y((distance_to_point(oRectangle.x, oRectangle.x)), cDir));
   
   x += (xTo - x) / 15;
   y += (yTo - y) / 15;
   view_xview[0] = -(view_wview[0] / 2) + x;
   view_yview[0] = -(view_hview[0] / 2) + y;
} else if (instance_exists(oSquare)) && (oSquare.active = true) {
   cDir = point_direction(x, y, oSquare.x, oSquare.y);
   xTo = (x + lengthdir_x((distance_to_point(oSquare.x, oSquare.y)), cDir));
   yTo = (y + lengthdir_y((distance_to_point(oSquare.x, oSquare.x)), cDir));
   
   x += (xTo - x) / 15;
   y += (yTo - y) / 15;
   view_xview[0] = -(view_wview[0] / 2) + x;
   view_yview[0] = -(view_hview[0] / 2) + y;
} else if (instance_exists(oTall)) && (oTall.active = true) {
   cDir = point_direction(x, y, oTall.x, oTall.y);
   xTo = (x + lengthdir_x((distance_to_point(oTall.x, oTall.y)), cDir));
   yTo = (y + lengthdir_y((distance_to_point(oTall.x, oTall.x)), cDir));
   
   x += (xTo - x) / 15;
   y += (yTo - y) / 15;
   view_xview[0] = -(view_wview[0] / 2) + x;
   view_yview[0] = -(view_hview[0] / 2) + y;
} else if (instance_exists(oFlat)) && (oFlat.active = true) {
   cDir = point_direction(x, y, oFlat.x, oFlat.y);
   xTo = (x + lengthdir_x((distance_to_point(oFlat.x, oFlat.y)), cDir));
   yTo = (y + lengthdir_y((distance_to_point(oFlat.x, oFlat.x)), cDir));
   
   x += (xTo - x) / 15;
   y += (yTo - y) / 15;
   view_xview[0] = -(view_wview[0] / 2) + x;
   view_yview[0] = -(view_hview[0] / 2) + y;
} else {
  exit;
}

view_xview[0] = clamp(view_xview[0], 0, room_width - view_wview[0]);
view_yview[0] = clamp(view_yview[0], 0, room_height - view_hview[0]);
