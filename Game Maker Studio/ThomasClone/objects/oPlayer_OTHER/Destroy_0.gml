with (oCamera) {
    alarm[0] = 8;
    screenShake = true;
}

var i;
for (i = 0; i < 8; ++i)
    instance_create(x, y, oBlood);

