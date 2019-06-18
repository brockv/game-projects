/// @description  in_light();

// Check if an instance is actually within the light source

if bbox_right < argument0.bbox_left || bbox_bottom < argument0.bbox_top
    || bbox_left > argument0.bbox_right || bbox_top > argument0.bbox_bottom
    {
    return false;
    }
else return true;
