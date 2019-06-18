// Actual collision checks + movement

// Vertical
repeat(abs(v)) {
    if (!place_meeting(x, y + sign(v), oParSolid))
        y += sign(v); 
    else {
        // Hop on floater
        if (instance_place(x, y + sign(v), oFloater)) {
            // Move nearest wave
            with (instance_place(x, y + sign(v), oFloater)) {
                var spd = other.v; // Player v
                liquid_apply_force_x(instance_nearest_bbox(oWater), x + sprite_width * 0.5, -spd * 0.25);
            }
        }
        
        // Move bridge
        if (instance_place(x, y + sign(v), oBridgeSegment)) {
            with (instance_place(x, y + sign(v), oBridgeSegment))
                phy_linear_velocity_y = other.v * 10;
        } else
            v = 0;
        break;
    }
}

// Horizontal
var tempH = h;

repeat(abs(h)) {
    // Bridge
    if (place_meeting(x, y + 1, oBridgeSegment)) {
        if (place_meeting(x + sign(h), y, oParSolid)) {
            // 5 pixel bridge slope
            if (place_meeting(x + sign(h), y - 4, oParSolid) && place_meeting(x + sign(h), y - 3, oParSolid) && place_meeting(x + sign(h), y - 2, oParSolid) && place_meeting(x + sign(h), y - 1, oParSolid)) {
                if (!place_meeting(x + sign(h), y - 5, oParSolid))
                    y -= 5;
            }
            
            // 4 pixel bridge slope
            if (place_meeting(x + sign(h), y - 3, oParSolid) && place_meeting(x + sign(h), y - 2, oParSolid) && place_meeting(x + sign(h), y - 1, oParSolid)) {
                if (!place_meeting(x + sign(h), y - 4, oParSolid))
                    y -= 4;
            }
            
            // 3 pixel bridge slope
            if (place_meeting(x + sign(h), y - 2, oParSolid) && place_meeting(x + sign(h), y - 1, oParSolid)) {
                if (!place_meeting(x + sign(h), y - 3, oParSolid))
                    y -= 3;
            }
        }
    } 
    // End bridge   
    
    // UP slope
    if (place_meeting(x + sign(h), y, oParSolid) && place_meeting(x + sign(h), y - 1, oParSolid) && !place_meeting(x + sign(h), y - 2, oParSolid)) {
        y -= 2;
        tempH = h * 0.7;
    } else if (place_meeting(x + sign(h), y, oParSolid) && !place_meeting(x + sign(h), y - 1, oParSolid)) {
        --y;
        tempH = h * 0.8;
    }
    
    // DOWN slope
    if (!place_meeting(x + sign(h), y, oParSolid) && !place_meeting(x + sign(h), y + 1, oParSolid) && !place_meeting(x + sign(h), y + 2, oParSolid) && place_meeting(x + sign(h), y + 3, oParSolid))
        y += 2;
    else if (!place_meeting(x + sign(h), y, oParSolid) && !place_meeting(x + sign(h), y + 1, oParSolid) && place_meeting(x + sign(h), y + 2, oParSolid))
        ++y; 

    if (!place_meeting(x + sign(h), y, oParSolid))
        x += sign(h); 
    else {
        h = 0;
        break;
    }
}

// Death by pits
if (y > room_height + 8)
    room_restart();


