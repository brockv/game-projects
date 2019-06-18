/// @description  Camera + Assemble Images

// Resolution tests
__view_set( e__VW.WView, 0, 640 );
__view_set( e__VW.HView, 0, 480 );
window_set_size(1280, 800);
surface_resize(application_surface, 1920, 1080);
Aura_Init(0.5, c_ltgray, true);

// Screen shake
shake = 0;

// Camera
playerActive = false;
alarm[0]     = room_speed * 2;
cam          = instance_create(oLevelGoal.x, oLevelGoal.y, oCamera)

__view_set( e__VW.Object, 0, cam );
__view_set( e__VW.HBorder, 0, __view_get( e__VW.WView, 0 ) / 2 );
__view_set( e__VW.VBorder, 0, __view_get( e__VW.HView, 0 ) / 2 );

// Initialize camera variables
hDist   = 0; // How far away horizontally the camera should be
vDist   = 0;  // How far away vertically the camera should be
cam.xTo = oLevelGoal.x + hDist; // Camera's initial xTo position
cam.yTo = oLevelGoal.y - vDist; // Camera's initial yTo position
peek    = oLevelGoal.sprite_width + 1; // Distance to check if a player is looking over a ledge
camSpd  = 20; //How quickly the camera should move. The lower the value, the faster it is

/*
// Assemble the player object at the spawner's location
AssemblePixels(oPlayerSpawner.x, oPlayerSpawner.y, oPlayer, sRectangle, 100, 4, image_blend, true);

/* */
/*  */
