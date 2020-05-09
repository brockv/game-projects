/// PreviousResolution();

switch (resolution) {
    case 1:
        global.displayWidth  = 1360;
        global.displayHeight = 768;
        alarm[0] = 10;
        resolution = 2;
    
    break;
    
    case 2:
        global.displayWidth  = 1600;
        global.displayHeight = 900;
        alarm[0] = 10;
        resolution = 3;
    
    break;
    
    case 3:
        global.displayWidth  = 1920
        global.displayHeight = 1080;
        alarm[0] = 10;
        resolution = 4;
    
    break;
    
    case 4:
        global.displayWidth  = 1280;
        global.displayHeight = 720;
        alarm[0] = 10;
        resolution = 1;
    
    break;
}
