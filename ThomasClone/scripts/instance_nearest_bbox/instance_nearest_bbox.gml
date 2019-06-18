/// @description instance_nearest_bbox(id)
/// @param id
/*
    Finds the nearest object (fairly, using bounding box rather than origin)
    
    ARGUMENTS
        id - real - object to check distance to
        
    RETURNS
        nearest - real - nearest object 
*/
   
    //initialise variables
    var distance,nearest,d;
    distance = 9000000000;
    nearest = noone;
    
    //check through all instances of the object
    with (argument0) 
    {
        //check distance to specific object
        d = distance_to_object(other.id);
        
        //save distance if closest
        if (d < distance) 
        {
            distance = d;
            nearest = id;
        }
    }
    
    //return nearest instance of the objects
    return nearest;
