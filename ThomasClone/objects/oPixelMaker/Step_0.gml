/// @description Create pixels
sec=delta_time/1000000;
alarm0-=sec;
//use delta time to create pixels at even intervals of time
if (alarm0<=0)
{
    if (ii<sprite_width)
    {
        if (jj<sprite_height)
        {
            CreatePixel(assemble)
            jj += size;
        }
        else
        {
            jj=0;
            ii+=size;
        }
    }
    alarm0=rate;
}



