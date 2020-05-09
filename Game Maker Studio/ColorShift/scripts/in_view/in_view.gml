/// @description  in_view();

// Check if an instance is in view, or if views aren't enabled.

if view_enabled
{
var a_left = x - aura_light_radius;
var a_top = y - aura_light_radius;
var a_right = x + aura_light_radius;
var a_bottom = y + aura_light_radius;
if a_right < __view_get( e__VW.XView, 0 ) || 
    a_bottom < __view_get( e__VW.YView, 0 ) || 
        a_left > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) || 
            a_top > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )
            {
            return false;
            }
        else return true;
}
else return true;

