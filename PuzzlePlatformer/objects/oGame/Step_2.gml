/// @description  Camera

// Make sure camera is inside room
__view_set( e__VW.XView, 0, max(0, min(__view_get( e__VW.XView, 0 ), room_width  - __view_get( e__VW.WPort, 0 ))) );
__view_set( e__VW.YView, 0, max(0, min(__view_get( e__VW.YView, 0 ), room_height - __view_get( e__VW.HPort, 0 ))) );      

// Adjust for screenshake
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (xcamo) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (ycamo) );

/// Screenshake

var r;

r = 0;

// Screenshake
if (shake) {
    r = choose(-1, 1);
    
    if (r) {
        xcamo = xshake * shakeDist;
        ycamo = 0;
        xshake *= -1;
    } else {
        xcamo = 0;
        ycamo = yshake * shakeDist;    
        yshake *= -1;
    }
// Small screenshake
} else if (babyshake) {
    r = choose(-1, 1);
    
    if (r) {
        xcamo = xshake * shakeDist * 0.5;
        ycamo = 0;
        xshake *= -1;
    } else {
        xcamo = 0;
        ycamo = yshake * shakeDist * 0.5;    
        yshake *= -1;
    }
} else {
    xcamo = 0;
    ycamo = 0;
}

