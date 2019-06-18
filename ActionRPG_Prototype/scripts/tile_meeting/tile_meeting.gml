///@arg x
///@arg y
///@arg tilemap

// Script argument variables
var _x = argument[0];
var _y = argument[1];
var _tilemap = argument[2];

// Collision variables
var _right_meeting = false;
var _left_meeting = false;
var _up_meeting = false;
var _down_meeting = false;

// Save the current position
var _x_pos = x;
var _y_pos = y;

// Horizontal collisions
if (_x != _x_pos)
{
	x = _x;
	
	if (_x > _x_pos)
	{
		_right_meeting = tilemap_get_at_pixel(_tilemap, bbox_right, bbox_top)	||
							tilemap_get_at_pixel(_tilemap, bbox_right, bbox_bottom);
	}
	else
	{
		_left_meeting =	tilemap_get_at_pixel(_tilemap, bbox_left, bbox_top) ||
							tilemap_get_at_pixel(_tilemap, bbox_left, bbox_bottom);
	}
}

//Vertical collisions
if (_y != _y_pos)
{
	y = _y;
	
	if (_y > _y_pos)
	{
		_down_meeting =	tilemap_get_at_pixel(_tilemap, bbox_right, bbox_bottom) ||
							tilemap_get_at_pixel(_tilemap, bbox_left, bbox_bottom);
	}
	else
	{
		_up_meeting = tilemap_get_at_pixel(_tilemap, bbox_right, bbox_top) ||
						tilemap_get_at_pixel(_tilemap, bbox_left, bbox_top);
	}
}

x = _x_pos;
y = _y_pos;

return (_right_meeting || _left_meeting || _up_meeting || _down_meeting);