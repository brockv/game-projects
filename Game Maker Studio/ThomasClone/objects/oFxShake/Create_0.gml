/// @description  Initialize variables.

hShake     = 100;
vShake     = 100;
shakeRate  = 25;
decayRate  = 0.97;
shakeTimer = 0;

xViewPrev = __view_get( e__VW.XView, 0 );
yViewPrev = __view_get( e__VW.YView, 0 );

