/// @description  1600 x 1024 Resolution.
__view_set( e__VW.WView, 0, 1600 );
__view_set( e__VW.HView, 0, 1024 );
__view_set( e__VW.WPort, 0, __view_get( e__VW.WView, 0 ) );
__view_set( e__VW.HPort, 0, __view_get( e__VW.HView, 0 ) );
surface_resize(application_surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
display_set_gui_size(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
window_set_size(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
Aura_Init(0.5, c_dkgray, true);

