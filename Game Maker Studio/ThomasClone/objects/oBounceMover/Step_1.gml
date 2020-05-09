/// @description  Check for player contact.
var playerAbovePrev = playerAbove;
playerAbove         = place_meeting(x, y - 1, oParEntity);

// If it's the first frame of player contact
if (playerAbove && !playerAbovePrev) {
    xscale = 0.94;
    yscale = 0.67;
    
    vy = fallSpd;
}

