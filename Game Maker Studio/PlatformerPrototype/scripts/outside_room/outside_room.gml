///@description outside_room(object,distance_outside_room)
///@param object,distance_outside_room
var object_outside = argument0;
var dist_outside	= argument1;
var outside = 0;

// Make sure instance exists.
if (instance_exists(object_outside) ) {
	if (object_outside.x < 0-dist_outside) || (object_outside.x > room_width+dist_outside) || (object_outside.y < 0-dist_outside) || (object_outside.y > room_height+dist_outside) {
		outside = true;	// yes, object is outside room bounds.
	} else {
		outside = false;	// No object is still inside the room.
	}
} else {
	outside	= false;	
}

// return if object is out of bounds.
return outside;