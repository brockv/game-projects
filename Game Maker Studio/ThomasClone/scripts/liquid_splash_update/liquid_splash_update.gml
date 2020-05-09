/// @description liquid_splash_update(id)
/// @param id
/*
    Updates the splash object (stop this executing if you want a pause)
    
    ARGUMENTS
        id - real - id of liquid object
*/
    
    //check to delete slpash
    var chk;
    chk = 0;
    
    //cycle through drop array
    for (i = 0; i < argument0.splashdrops; i += 1)
    {
        //current drop movement
        argument0.splasharray[i, 0] += argument0.splasharray[i, 2];
        argument0.splasharray[i, 1] += argument0.splasharray[i, 3];
        argument0.splasharray[i, 3] += argument0.splashdropgravity;
        argument0.splasharray[i, 4] = max(argument0.splasharray[i, 4]-1/10, 0); 
       
        //check if drop is gone
        if (argument0.splasharray[i, 4] == 0) chk += 1;
        
        /* 
        splasharray[?,0] - the x of the drop
        splasharray[?,1] - the y of the drop
        splasharray[?,2] - the xspeed of the drop
        splasharray[?,3] - the yspeed of the drop
        splasharray[?,4] - the size of the drop
        */
    }
    
    //delete if all drops are dead
    if (chk = argument0.splashdrops) instance_destroy();
