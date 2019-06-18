action_color(16777215);
///Draw stats when visible.

//Use default font
draw_set_font(-1);

//FPS
draw_text(25, 25, string_hash_to_newline("FPS (locked|real): " + string(fps) + "|" + string(fps_real)));

//Orientation
if global.display_orientation = 0 { 
   draw_text(25, 50, string_hash_to_newline("Orientation: Landscape")); 
}
if global.display_orientation = 1 { 
   draw_text(25, 50, string_hash_to_newline("Orientation: Portrait")); 
}

//Resolution
if global.display_dpi_current = global.display_dpi {
   draw_text(25, 75, string_hash_to_newline("Resolution (W|H): " + string(__view_get( e__VW.WPort, global.display_view )) + "x" + string(__view_get( e__VW.HPort, global.display_view )))); 
} else { 
   draw_text(25, 75, string_hash_to_newline("Resolution (W|H): " + string(__view_get( e__VW.WPort, global.display_view )) + "x" + string(__view_get( e__VW.HPort, global.display_view )) + " (Adjusted for DPI)")); 
}

//DPI
draw_text(25, 100, string_hash_to_newline("DPI (virtual|actual): " + string(global.display_dpi_current) + "|" + string(global.display_dpi)));

//Scale Multiplier
draw_text(25, 125, string_hash_to_newline("Scale Multiplier (W|H): " + string(global.display_xscale) + "|" + string(global.display_yscale)));

//Zoom Multiplier
draw_text(25, 150, string_hash_to_newline("Zoom Multiplier: " + string(global.display_zoom)));

