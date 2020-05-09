/// @description MakerDie();
//This function is run by oPixel and should not be called by the user directly
//it changes the maker object into whichever object was specified in scr_assemble_pixels
if (maker.count==maker.total)
{
    with maker
    {
        with instance_create(x,y,object)
        {
            image_blend=other.image_blend;
            image_angle=other.image_angle;
        }
        instance_destroy()
    }
    with oPixel
    {
        if (maker==other.maker)
        {
            instance_destroy();
        }
    }
}
