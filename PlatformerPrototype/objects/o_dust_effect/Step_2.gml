/// @description Delay & stick to objects

if (delay > 0) {
    delay--;
    visible = false;
    image_index = 0;
    if (delay == 0) {
        visible = true;
    }
}

if (stick_to != noone) {
	if (instance_exists(stick_to)) {
	    x = stick_to.x;
	    y = stick_to.y;
	    image_xscale = stick_to.image_xscale*stick_to.facing;
	    image_yscale = stick_to.image_yscale;
	} else {
	    stick_to = noone;
	}
}





