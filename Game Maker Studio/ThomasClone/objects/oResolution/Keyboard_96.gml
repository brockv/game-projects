/// @description  640 x 480 Resolution.
__view_set( e__VW.WView, 0, 640 );
__view_set( e__VW.HView, 0, 480 );
__view_set( e__VW.WPort, 0, __view_get( e__VW.WView, 0 ) );
__view_set( e__VW.HPort, 0, __view_get( e__VW.HView, 0 ) );
surface_resize(application_surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
display_set_gui_size(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
window_set_size(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
Aura_Init(0.5, c_dkgray, true);

