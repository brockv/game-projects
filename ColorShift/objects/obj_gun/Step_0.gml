/// @description item floating and gravity

if instance_place(x,y+1,obj_solid_block)<0
    {
    gravity=0.125
    
    clamp(vspeed,-1,1)
    }
else
    {
    if gravity>0
        {
        gravity=0
        vspeed=0
        }
    else
        {
        if instance_place(x,y-1,obj_solid_block)<0
            {
            vspeed=-1.25
            }
        }
    }

///solid collisions

if scr_collision_detector(270)
    {move_contact_solid(270,abs(vspeed)) move_outside_solid(90,abs(vspeed)) vspeed = 0}

if scr_collision_detector(90)
    {move_contact_solid(90,abs(vspeed)) move_outside_solid(270,abs(vspeed)) vspeed = 0}

if scr_collision_detector(0)
    {move_contact_solid(0,abs(hspeed)) move_outside_solid(180,abs(hspeed)) hspeed = 0}

if scr_collision_detector(180)
    {move_contact_solid(180,abs(hspeed)) move_outside_solid(0,abs(hspeed)) hspeed = 0}

