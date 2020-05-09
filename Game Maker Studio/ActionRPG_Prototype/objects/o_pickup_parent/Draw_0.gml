/// @description Draw the Pickup

// Draw the pickup with the appropriate sprite, image, and position
draw_sprite(sprite_index, image_index, x, y + z_);

// Draw a flashing effect once the lifespan alarm has expired
if (alarm[0] <= 0)
{
	var _interval = ceil(alarm[1] / global.one_second) * 8;
	draw_self_flash(c_white, _interval, alarm[1]);
}
