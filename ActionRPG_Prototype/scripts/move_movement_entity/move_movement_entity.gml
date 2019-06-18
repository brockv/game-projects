///@param _bounce
var _bounce = argument[0];

// The tilemap to use for collision detection
var _tilemap = layer_tilemap_get_id("Collisions");

// Apply friction when sliding on walls
if (tile_meeting(x + lengthdir_x(speed_, direction_), y + lengthdir_y(speed_, direction_), _tilemap)) && !_bounce {
	speed_ = approach(speed_, 0, friction_ / 2);
}

var _x_speed = lengthdir_x(speed_, direction_);
var _y_speed = lengthdir_y(speed_, direction_);

if (speed_ <= 0) exit; // No need to check for collisions

if (tile_meeting(x + _x_speed, y, _tilemap)) {
	while (!tile_meeting(x + sign(_x_speed), y, _tilemap)) {
		x += sign(_x_speed);
	}
	
	if (_bounce) {
		_x_speed = -(_x_speed) * bounce_amount_;
	} else {
		_x_speed = 0;
	}
}

x += _x_speed;

if (tile_meeting(x, y + _y_speed, _tilemap)) {
	while (!tile_meeting(x, y + sign(_y_speed), _tilemap)) {
		y += sign(_y_speed);
	}
	
	if (_bounce) {
		_y_speed = -(_y_speed) * bounce_amount_;
	} else {
		_y_speed = 0;
	}
}

y += _y_speed;

// Make sure to update speed and direction
speed_ = point_distance(0, 0, _x_speed, _y_speed);
direction_ = point_direction(0, 0, _x_speed, _y_speed);