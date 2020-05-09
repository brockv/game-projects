/// @description  Update camera position.

var xTo, yTo, cDir;

// Single object camera
if (instance_exists(oPlayer)) {
   cDir = point_direction(x, y, oPlayer.x, oPlayer.y);
   xTo = (x + lengthdir_x((distance_to_point(oPlayer.x, oPlayer.y)), cDir));
   yTo = (y + lengthdir_y((distance_to_point(oPlayer.x, oPlayer.x)), cDir));
   
   x += (xTo - x) / 25;
   y += (yTo - y) / 25;
   __view_set( e__VW.XView, 0, -(__view_get( e__VW.WView, 0 ) / 2) + x );
   __view_set( e__VW.YView, 0, -(__view_get( e__VW.HView, 0 ) / 2) + y );
   
   __view_set( e__VW.XView, 0, clamp(__view_get( e__VW.XView, 0 ), 0, room_width - __view_get( e__VW.WView, 0 )) );
   __view_set( e__VW.YView, 0, clamp(__view_get( e__VW.YView, 0 ), 0, room_height - __view_get( e__VW.HView, 0 )) );
}

