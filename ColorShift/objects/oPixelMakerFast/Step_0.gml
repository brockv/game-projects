/// @description Create pixels
//the difference here is that an entire column of pixels is created,
//instead of one pixel at a time.
sec=delta_time/1000000;
alarm0-=sec;

if (alarm0<=0)
{
    if (ii<sprite_width)
    {
        for (jj = 0; jj < sprite_height; jj += size)
        {
            CreatePixel(assemble)
        }
        ii+=size;
    }
    alarm0=rate;
}



