/// @description Draw the grass objects.

// Apply the skew variables to the grass sprites and draw them.
draw_sprite_pos(sprite_index, image_index,bbox_left + xskew,bbox_top ,bbox_right + xskew,bbox_top,
				bbox_right,bbox_bottom + 1,bbox_left,bbox_bottom + 1,image_alpha);
