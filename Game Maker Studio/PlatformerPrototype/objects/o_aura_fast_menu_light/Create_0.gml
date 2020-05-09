// This is a FAST light object. This uses no surfaces and is simply the 
// instance sprite drawn at the appropriate moment to the main Aura
// surface. As Such, you can set most of the properties as you would for 
// a regular instance sprite.

// Note that the object itself has the "visible" flag set to false, and 
// is a child of the o_aura_light_parent_fast.

scale = 0.05 + random(0.05);

Aura_Light_Init_Fast(scale, scale, 0, merge_color(c_white, c_yellow, 0.25), 1);

speed = 0.5 + random(2);
direction = 90;
image_angle = 90;
image_alpha = 0.5 + random(0.5);


