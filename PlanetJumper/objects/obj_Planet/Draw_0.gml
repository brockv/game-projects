/// @description Draw the Planets

// Draw planet
draw_set_circle_precision(planetRadius/2);
draw_set_color(make_color_rgb(lerp(r,r2,fade),lerp(g,g2,fade),lerp(b,b2,fade)));
draw_circle(x,y,planetRadius,false);

