if (v < 1 && v > -1) {
    repeatY += v;
}

if (v >= 1 || v <= 1)
    repeatY = v;
  
repeat(abs(repeatY)) {
    if (!place_meeting(x, y + sign(v), oParSolid)) {
        with (oPlayer) {
            if (place_meeting(x, y + 1, other.id)) {
                if (!PlaceMeetingException(x, y + sign(other.v), oParSolid, other.id))
                    y += sign(other.v);
            }
            
            if (place_meeting(x, y - 1, other.id))
                y += sign(other.v);
        }
        y += sign(v);
    } else
        v *= -1;
}

if (v < 1 && v > -1) {
    if (repeatY <= -1)
        repeatY += 1;
    else if repeatY >= 1
        repeatY -= 1;   
}

if (h < 1 && h > -1)
    repeatX += h;

if (h >= 1 || h <= -1)
    repeatX = h;
    
repeat(abs(repeatX)) {
    if (!place_meeting(x + sign(h), y, oParSolid)) {
        with (oPlayer) {

            if ((instance_place(x - 1, y, oMover) == other.id || instance_place(x + 1, y, oMover) == other.id) && !onGround) {
                if (!PlaceMeetingException(x + sign(other.h), y, oParSolid, other.id))
                    x += sign(other.h);
            } else if (place_meeting(x - sign(other.h), y, other.id))
               x += sign(other.h);
            
            if (platformTarget != other.id)
                break;
            
            if (!place_meeting(x, y, other.id) && place_meeting(x, y + 1, other.id)) {
                if (!platformTarget)
                    platformTarget = other.id;
            
                if (!place_meeting(x + sign(other.h), y, oParSolid) && platformTarget == other.id)
                    x += sign(other.h);
            }   
        }
        
        x += sign(h);
    } else
        h *= -1;
}

if (h < 1 && h > -1) {
    if (repeatX <= -1)
        repeatX += 1;
    else if (repeatX >= 1)
        repeatX -= 1;   
}

phy_position_x = x;
phy_position_y = y;

