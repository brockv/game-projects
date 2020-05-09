if (!init) {
    offset = 10;
    head   = self;
    next   = instance_create(x, y + offset, oRopeSegment);
    
    attach = physics_joint_rope_create(head, next, head.x, head.y, next.x, next.y, 1, false);
    physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
    physics_joint_set_value(attach, phy_joint_frequency, 10);
    physics_joint_set_value(attach, phy_joint_max_length, 1);
          
    with(next){
        parent = other.id;
    }
    
    repeat (ROPE_LENGTH) {
        offset += 10;
        
        tail = next;
        next = instance_create(x, y + offset, oRopeSegment);
        link = physics_joint_rope_create(tail, next, tail.x, tail.y, next.x, next.y, 1, false);    
        physics_joint_set_value(link, phy_joint_damping_ratio, 1);
        physics_joint_set_value(link, phy_joint_frequency, 10);
        physics_joint_set_value(link, phy_joint_max_length, 1);        
        
        with (next)
            parent = other.tail;
    }
        
    // Moving platform
    if (parent != -1) {
        xparentoffset = x - parent.x;
        yparentoffset = y - parent.y;    
    }
    init = true;
}

/*
if (!init) {
    offset = 10;
    head   = self;
    next   = instance_create(x, y + offset, oRopeSegment);
    
    attach = physics_joint_rope_create(head, next, head.x, head.y, next.x, next.y, 1, false);
    physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
    physics_joint_set_value(attach, phy_joint_frequency, 10);
    
    with(next){
        parent = other.id;
    }
    
    repeat (ROPE_LENGTH) {
        offset += 10;
        
        tail = next;
        next = instance_create(x, y + offset, oRopeSegment);
        link = physics_joint_rope_create(tail, next, tail.x, tail.y, next.x, next.y, 1, false);    
        physics_joint_set_value(link, phy_joint_damping_ratio, 1);
        physics_joint_set_value(link, phy_joint_frequency, 10);
        physics_joint_set_value(link, phy_joint_max_length, 1);        
        
        with (next)
            parent = other.tail;
    }
        
    // Moving platform
    if (parent != -1) {
        xparentoffset = abs(x - parent.x);
        yparentoffset = abs(y - parent.y);    
    }
    init = true;
}
*/

/* */
/*  */
