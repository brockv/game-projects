/// @description liquid_update(id)
/// @param id
/*
    Updates the liquid object (stop this executing if you want a pause)
    
    ARGUMENTS
        id - real - id of liquid object
*/

    //cycle through the wave wobble
    argument0.liquidwaveangle += argument0.liquidwavespeed;
    
    var lldelt, lrdelt, ldiff, exec, i;
    
    //loop through to manipulate each node
    for (i = 0; i < argument0.liquidnodes; i += 1)
    {
        //get y differences between surrounding nodes, checking for edge nodes
        if (argument0.liquidsides) //edge movement is on
        {
            if ((i-1 <= -1)) //if current node is the leftmost edge
            {
                //only use values from right side for movement
                lldelt = (argument0.y-argument0.liquidarray[i, 0]);
                lrdelt = (argument0.liquidarray[i+1, 0]-argument0.liquidarray[i, 0]);
                ldiff = (0+argument0.liquidarray[i+1, 1]);
            }
            else if (i+1 >= argument0.liquidnodes) //if node is the rightmost edge
            {
                //only use values from left side for movement
                lldelt = (argument0.liquidarray[i-1, 0]-argument0.y);
                lrdelt = (argument0.liquidarray[i+1, 0]-argument0.liquidarray[i, 0]);
                ldiff = (argument0.liquidarray[i-1, 1]+0);
            }
            else // if node is in middle
            {
                //use values from both sides for movement
                lldelt = (argument0.liquidarray[i-1, 0]-argument0.liquidarray[i, 0]);
                lrdelt = (argument0.liquidarray[i+1, 0]-argument0.liquidarray[i, 0]);
                ldiff = (argument0.liquidarray[i-1, 1]+argument0.liquidarray[i+1, 1]);
            }
            exec = 1;
        }
        else //edge movement is off
        {
            //get y differences between surrounding nodes
            lldelt = (argument0.liquidarray[i-1, 0]-argument0.liquidarray[i, 0]);
            lrdelt = (argument0.liquidarray[i+1, 0]-argument0.liquidarray[i, 0]);
            ldiff = (argument0.liquidarray[i-1, 1]+argument0.liquidarray[i+1, 1]);
            
            //if current node is an edge node, dont execue movement, else do
            exec = ((i-1 > -1) && (i+1 < argument0.liquidnodes));
        }
        
        //actually move nodes, if node is in middle (or at edge and edge movement is set)
        if (exec)
        {
            //move node based on other nodes (transfer waves energy to self)
            argument0.liquidarray[i, 1] += (lldelt+lrdelt+ldiff)/(argument0.liquidfactor*argument0.liquidspring);
            
            //move based on y position
            argument0.liquidarray[i, 1] += ((argument0.y) - (argument0.liquidarray[i, 0]))/(argument0.liquidfactor*argument0.liquidspring)
            argument0.liquidarray[i, 2] = (argument0.liquidarray[i, 1])/(argument0.liquidfactor/argument0.liquidfriction);
            argument0.liquidarray[i, 1] -= argument0.liquidarray[i, 2];
            argument0.liquidarray[i, 3] = (dsin(argument0.liquidwaveangle+argument0.liquidarray[i, 4])*argument0.liquidwaveamount)*is_even(i);

            //move the current node
            argument0.liquidarray[i, 0] += argument0.liquidarray[i, 1] + moveSpd;
            
            //
            //
            // The following code snippet is unrelated to the water manipulation //////////////////
            
            // Update floater
            with (oFloater) {
                node = ((x + sprite_width * 0.5) - argument0.x) / 16;
                
                if (pool.liquid.id == other.id && abs(node - i) < 1) {
                    pyp            = phy_position_y;
                    phy_position_y = ystart + (argument0.ystart - argument0.liquidarray[i, 0]); //argument0.liquidarray[i, 0])  - (sprite_height * 0.5)
                }
            }
            
            ///////////////////////////////////////////////////////////////////////////////////////
            //
            // End floater code
        }
    }
