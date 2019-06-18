/// @description liquid_splash_create(id, x, y, force, drops, dropsize, dropspread, dropgravity, col, alpha, blend)
/// @param id
/// @param  x
/// @param  y
/// @param  force
/// @param  drops
/// @param  dropsize
/// @param  dropspread
/// @param  dropgravity
/// @param  col
/// @param  alpha
/// @param  blend
/*
    Creates a splash with custom attributes, balonging to a specific liquid
    
    ARGUMENTS
        id - real - id of liquid object the splash belongs to
        x, y - real - splash's origin
        force - real - initial y speed of drops
        drops - real - amount of drops in the splash
        dropsize - real - average diameter of drops
        dropspread - real - how far from the origin the drops can spawn from
        dropgravity - real - rate at which the drops will fall
        
    RETURNS
        id - real - id of splash object
*/
    //set splash variables
    var splashid;
    splashid = instance_create(argument1, argument2, objSplash);
    splashid.splashliquid = argument0;
    splashid.splashforce = argument3;
    splashid.splashdrops = argument4;
    splashid.splashdropsize = argument5;
    splashid.splashdropspread = argument6;
    splashid.splashdropgravity = argument7;
    splashid.splashdropcolour = argument8;
    splashid.splashdropalpha = argument9;
    splashid.splashdropblend = argument10;
    
    //create splash array
    with (splashid)
    {
        for (i = 0; i <= splashdrops; i += 1)
        {
            splasharray[i, 0] = x+random_range(-splashdropspread, splashdropspread);
            splasharray[i, 1] = y;
            splasharray[i, 2] = splasharray[i, 0]-x;
            splasharray[i, 3] = splashforce+random_range(-3, 3);
            splasharray[i, 4] = max((splashdropsize+random_range(-3, 3))/2, 1);
        }
        /* 
        splasharray[?,0] - the x of the drop
        splasharray[?,1] - the y of the drop
        splasharray[?,2] - the xspeed of the drop
        splasharray[?,3] - the yspeed of the drop
        splasharray[?,4] - the size of the drop
        */
    }
    
    //return splash handle
    return splashid;
