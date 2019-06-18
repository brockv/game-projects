var i;

// Vertical
for (i = 0; i < abs(phy_linear_velocity_y); ++i) {
    with (oPlayer) {
        if (place_meeting(x, y + 1, other.id)) {
            if (!PlaceMeetingException(x, y + sign(other.phy_linear_velocity_y), oParSolid, other.id))
                y += other.bbox_top - bbox_bottom;
        }
        
        if (place_meeting(x, y - 1, other.id))
            y += other.bbox_top - bbox_bottom;
    }
}
    

