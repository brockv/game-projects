///@description laser(length, precision, color)
///@arg length
///@arg precision
///@arg color

// This script calculates and draws where the laser is supposed to go using raycasting type collisions.

var _length = argument[0];     // The maximum length of the laser
var _precision = argument[1];  // How precise the raycasting is -- smaller numbers are more precise but take more memory
var _color = argument[2];	   // The color of the laser

// Set the color and alpha for the laser
draw_set_color(c_white);
draw_set_alpha(1);

// Loop to check for collisions
for (var _i = 0; (_i < _length) && (!collision_point(xx_ + lengthdir_x(_i, dir_), yy_ + lengthdir_y(_i, dir_), o_solid_parent, true, true)); _i += _precision) {
	//// If the laser is colliding with a splitter, move the laser to the center of it (just for looks)
	//if (place_meeting(xx_ + lengthdir_x(_i, dir_), yy_ + lengthdir_y(_i, dir_), o_splitter_parent)) {
	//	dis_ = _i + (o_splitter_parent.sprite_width / 2 - 4);
	//// If the laser is colliding with a filter, move the laser to the center of it (just for looks)
	//} else if (place_meeting(xx_ + lengthdir_x(_i, dir_), yy_ + lengthdir_y(_i, dir_), o_filter_parent)) {
	//	dis_ = _i + (o_filter_parent.sprite_width / 2);
	//// If the laser is colliding with a slider or wall, stop it at the edge
	//} else if (place_meeting(xx_ + lengthdir_x(_i, dir_), yy_ + lengthdir_y(_i, dir_), o_slider_horizontal_parent) ||
	//				place_meeting(xx_ + lengthdir_x(_i, dir_), yy_ + lengthdir_y(_i, dir_), o_slider_vertical_parent)  ||
	//				place_meeting(xx_ + lengthdir_x(_i, dir_), yy_ + lengthdir_y(_i, dir_), o_block_normal)) {
	//	dis_ = _i;
	//// Otherwise, stop it a little past the edge
	//} else {
	//	dis_ = _i + 10;
	//}
	dis_ = _i;
}

// Two sets of coordinates of where the laser ends
var _xx1 = xx_ + lengthdir_x(dis_, dir_);
var _yy1 = yy_ + lengthdir_y(dis_, dir_);
var _xx2 = xx_ + lengthdir_x(dis_ + _precision, dir_);
var _yy2 = yy_ + lengthdir_y(dis_ + _precision, dir_);

// Draw the laser between the coordinates
draw_laser(xx_, yy_, _xx2, _yy2, 2, _color);

//// Particles at colision point (not necessary -- just for looks)
//part_type_color1(particle_, _color);
//part_emitter_region(part_system_, part_emitter_, _xx1, _xx1, _yy1, _yy1, 0, 0);
//part_emitter_burst(part_system_, part_emitter_, particle_, 1);

#region Filters
// Checks if the laser is colliding with a filter, then tells it to shoot out the new color
if (collision_point(_xx1, _yy1, o_filter_parent, false, true) || collision_point(_xx2, _yy2, o_filter_parent, false, true)) {
	// Grab the splitter the laser is colliding with
	_filter = instance_nearest(_xx2, _yy2, o_filter_parent);
	
	// If the filter isn't currently grabbed, proceed
	if (!_filter.grabbed_) {
		_filter.active_ = true;
		_filter.dis_ = _length - dis_;
		_filter.dir_ = dir_;
		_filter.alarm[0] = 2;
	
		// Filter the color
		var _filtered_color = subtract_colors(_color, _filter.filtered_color_); 
		
		// Don't fire a laser if it's black
		if (_filtered_color != make_color_rgb(0, 0, 0)) {
			// Have the laser "pass through" the filter
			_filter.xx_ = _xx2;
			_filter.yy_ = _yy2;
		    with _filter { laser(dis_, 5, _filtered_color) }
		}
	// Otherwise, deactivate it
	} else {
		_filter.active_ = false;
	}
}
#endregion

#region Switches
// Checks if the laser is colliding with a switch, and activates it if so
if (collision_point(_xx1, _yy1, o_switch_parent, false, true) || collision_point(_xx2, _yy2, o_switch_parent, false, true)) {
	// Grab the switch that the laser is colliding with
	_switch = instance_nearest(_xx2, _yy2, o_switch_parent);
	
	// If the laser color matches the active color of the switch, activate it
	if (_color == _switch.active_color_) {
		// Set the variables for the switch
		_switch.active_ = true;
		_switch.color_ = _color;
		_switch.dis_ = _length;
		_switch.dir_ = dir_;
		_switch.alarm[0] = 2;
		
		// Have the laser "pass through" the switch
		_switch.xx_ = _xx1;
		_switch.yy_ = _yy1;
		with _switch { laser(dis_, 5, _color) }
		
	// Otherwise, deactivate it
	} else {
		_switch.active_ = false;
		_switch.color_ = _switch.start_color_;
		exit;
	}
}
#endregion

#region Splitters
// Checks if the laser is colliding with a splitter, then tells the splitter to shoot out lasers
if (collision_point(_xx1, _yy1, o_splitter_parent, false, true) || collision_point(_xx2, _yy2, o_splitter_parent, false, true)) {    
	
	// Particles at colision point (not necessary -- just for looks)
	part_type_color1(particle_, _color);
	part_emitter_region(part_system_, part_emitter_, _xx1, _xx1, _yy1, _yy1, 0, 0);
	part_emitter_burst(part_system_, part_emitter_, particle_, 1);
	
	// Grab the splitter the laser is colliding with
	_splitter = instance_nearest(_xx2, _yy2, o_splitter_parent);
	
	// If the splitter isn't currently being moved, have it shoot out lasers
	if (!_splitter.grabbed_) {		
		// Set the variables for the splitter
		_splitter.active_ = true;
		_splitter.dis_ = _length - dis_;
		_splitter.alarm[0] = 2;

		// If the current color isn't noone, and isn't already in this splitters color list, add it
		if (_color != noone && ds_list_find_index(_splitter.color_list_, _color) == -1) {
			ds_list_add(_splitter.color_list_, _color);
		}
	}
}
#endregion

#region Mirrors
//// Checks if the laser is colliding with a mirror, and makes the mirror reflect if so
//if (collision_point(_xx1, _yy1, o_mirror_parent, false, true) || collision_point(_xx2, _yy2, o_mirror_parent, false, true)) {
//    // Grab the mirror the laser is colliding with
//	_mirror = instance_nearest(_xx2, _yy2, o_mirror_parent);
	
//	// Assign the variables for bouncing the laser
//	_mirror.xx_ = _xx1;
//    _mirror.yy_ = _yy1;
//    _mirror.dir_ = _mirror.v1_ + (_mirror.v2_ - dir_);
//    _mirror.dis_ = _length - dis_;
	
//	// Bounce the laser
//    with _mirror { laser(dis_, 5, _color) }
//}
#endregion
