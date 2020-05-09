/// @description  1920 x 1080 Resolution.
__view_set( e__VW.WView, 0, 640 );
__view_set( e__VW.HView, 0, 480 );
window_set_size(1920, 1080);
surface_resize(application_surface, 1920, 1080);

/*
view_wview = 1920;
view_hview = 1080;
view_wport = view_wview;
view_hport = view_hview;
surface_resize(application_surface, view_wview, view_hview);
display_set_gui_size(view_wview, view_hview);
window_set_size(view_wview, view_hview);
Aura_Init(0.5, c_dkgray, true);

/* */
/*  */
