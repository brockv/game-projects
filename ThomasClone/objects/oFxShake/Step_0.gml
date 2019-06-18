/// @description  Shake the screen.

shakeTimer += 0.02;

hShake = hShake * decayRate;
vShake = vShake * decayRate;

if (hShake <= 1) {
   __view_set( e__VW.XView, 0, xViewPrev );
   __view_set( e__VW.YView, 0, yViewPrev );
   instance_destroy();
}

var xP = hShake * cos(shakeTimer * shakeRate);
var yP = vShake * sin(shakeTimer * shakeRate);

__view_set( e__VW.XView, 0, xP );
__view_set( e__VW.YView, 0, yP );

