/// @description liquid_buildnodes(id)
/// @param id
/*
    Ran by scripts when creating or refreshing a liquid object
    
    ARGUMENTS
        id - real - id of liquid object
*/
    
    //become the liquid object
    with (argument0)
    {
        //create each node
        for (i = 0; i <= liquidnodes; i += 1)
        {
            liquidarray[i, 0] = y;
            liquidarray[i, 1] = 0;
            liquidarray[i, 2] = (liquidarray[i, 1])/(room_speed/liquidfriction);
            liquidarray[i, 3] = 0;
            liquidarray[i, 4] = random(360);
        }
        /* 
        liquidarray[?,0] - the y of the node
        liquidarray[?,1] - the ysp of the node
        liquidarray[?,2] - the friction of the node
        liquidarray[?,3] - the wave offset of the node
        liquidarray[?,4] - the random wave offset of the node
        */
    }
