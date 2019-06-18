/// @description scr_collision_detector(direction)
/// @param direction


if argument0=270
    {
    if vspeed>0 and instance_place(x,y+vspeed,obj_solid_block)
        {
        return 1
        }
    }
    
if argument0=90
    {
    if vspeed<0 and instance_place(x,y+vspeed,obj_solid_block)
        {
        return 1
        }
    }
    
    
if argument0=0
    {
    if hspeed>0 and instance_place(x+hspeed,y,obj_solid_block)
        {
        return 1
        }
    }
    
if argument0=180
    {
    if hspeed<0 and instance_place(x+hspeed,y,obj_solid_block)
        {
        return 1
        }
    }
