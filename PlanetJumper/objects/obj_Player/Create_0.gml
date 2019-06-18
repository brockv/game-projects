/// @description Initialize Variables

// Room speed
room_speed = 60;

// Settings
walkSpd = 4; // Walking speed
airControl = 0.2; // Maneuverability when not on planet
maxSpd = 20; // Maximum moving speed
jumpForce = 9; // Jump height
grav = 6000; // Gravity force
landForce = 0.2; // Force applied to a planet when landing on it
distLimit = 800; // Maximum allowed distance from the nearest planet
offset = sprite_height/2-1; // Give offset to prevent sinking into the ground
turnSpd = 0.2; // How fast the player sprite turns (between 0-1)

// Movement
xSpd = 0;
ySpd = 0;
onPlanet = false;
onPlatform = false;
planet = 0;
platform = 0;
near = -1;

