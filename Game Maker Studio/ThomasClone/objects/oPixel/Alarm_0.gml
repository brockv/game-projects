/// @description Assemble Image
//This alarm only runs when the pixel is putting an image together.
//Better than using step event because the alarm doesn't have to run every step,
//and the alarm won't run at all if the pixel is dead
//an object with no code running is comparable to a particle!
if (!dead)
{
    //Decreasing this alarm causes the code to run more often.
    //Increasing it causes pixels to take longer to find their destination.
    alarm[0]=2;
    dist = point_distance(x,y,xdest,ydest);
    image_alpha=(speed+1)/sqrt(1+dist);
    
    if (dist > speed)
    {
        motion_add(point_direction(x,y,xdest,ydest),maker.sec*(room_speed*(image_alpha+.1)));
    }
    else
    {
        dead=1;
        speed = 0;
        x = xdest;
        y = ydest;
        maker.count+=1;
        //The very last pixel will trigger the code below
        MakerDie();
    }
}

