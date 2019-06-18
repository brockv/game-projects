/// @description edgeds_draw_background(background, x, y, index, foreground, tile, scale mode);
/// @param background
/// @param  x
/// @param  y
/// @param  index
/// @param  foreground
/// @param  tile
/// @param  scale mode

/*
Sets and scales a background to one of 8 available background slots, using one 
of three types of scaling: x-y scaling, x-only scaling, or y-only scaling. Can
also optionally draw as a foreground rather than a background.

argument0 = the background to draw (background)
argument1 = the x position to draw the background (real)
argument2 = the y position to draw the background (real)
argument3 = the background index to assign the background to (integer) (0-7)
argument4 = enables or disables drawing as a foreground (boolean) (true/false)
argument5 = enables or disables tiling the background (boolean) (true/false)
argument6 = sets whether to use x-y scaling (0), x-only scaling (1), or y-only scaling (2)

Example usage: edgeds_draw_background(my_bg, view_xview[0], view_yview[0], 0, false, false, 0);
*/

/*
INITIALIZE
*/

var display_width = __view_get( e__VW.WView, global.display_view );
var display_height = __view_get( e__VW.HView, global.display_view );

/*
SET AND SCALE BACKGROUND
*/

//Set the background
if __background_get( e__BG.Index, argument3 ) != argument0 {
   __background_set( e__BG.Index, argument3, argument0 );
   __background_set( e__BG.Foreground, argument3, argument4 );
   __background_set( e__BG.HTiled, argument3, argument5 );
   __background_set( e__BG.VTiled, argument3, argument5 );
   __background_set( e__BG.Visible, argument3, true );
   
   //Apply background scaling across rooms
   if global.display_scale_time = 0 {
      global.display_scale_time = 1;
   }
}

//Position the background
__background_set( e__BG.X, argument3, argument1 );
__background_set( e__BG.Y, argument3, argument2 );

//Scale the background
if global.display_scale_time > 0 {   
   if global.display_xscale != 0 and global.display_yscale != 0 {
      //X-Y and X-only scaling
      if argument6 = 0 or argument6 = 1 {
         //Scale width
         __background_set( e__BG.XScale, argument3, __background_get( e__BG.YScale, argument3 )*(display_width/(__background_get( e__BG.Width, argument3 )*__background_get( e__BG.XScale, argument3 ))) );
         __background_set( e__BG.YScale, argument3, __background_get( e__BG.XScale, argument3 ) );
      }
         
      //X-Y scaling
      if argument6 = 0 {
         //Scale height
         if __background_get( e__BG.Height, argument3 )*__background_get( e__BG.YScale, argument3 ) < display_height {
            __background_set( e__BG.YScale, argument3, __background_get( e__BG.XScale, argument3 )*(display_height/(__background_get( e__BG.Height, argument3 )*__background_get( e__BG.YScale, argument3 ))) );
            __background_set( e__BG.XScale, argument3, __background_get( e__BG.YScale, argument3 ) );
         }   
      }
         
      //Y-only scaling
      if argument6 = 2 {
         //Scale height
         __background_set( e__BG.YScale, argument3, __background_get( e__BG.XScale, argument3 )*(display_height/(__background_get( e__BG.Height, argument3 )*__background_get( e__BG.YScale, argument3 ))) );
         __background_set( e__BG.XScale, argument3, __background_get( e__BG.YScale, argument3 ) );
      }         
   }
}
