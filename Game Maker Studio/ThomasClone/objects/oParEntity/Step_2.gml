/// @description  Handle sub-pixel movement

cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

jumped = false;
landed = false;

repeat(abs(vyNew)) {
    if (!PlatformCheck())
        y += sign(vy);
    else {
        vy = 0;
        break;
    }
}

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}

repeat(abs(vxNew)) {        
    if (!place_meeting(x + sign(vx), y, oParSolid))
        x += sign(vx);
    else {
        vx = 0;
        break;
    }
}

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0)
    instance_destroy();
    


