///@description Movement

// Inherit from o_pathfinding_object
event_inherited();


// Check if on the ground
ground = check_collision(0, 1);

// State machine for each possible state that the entity can be in
switch (state) {
    case state.normal:
        // Set acceleration & friction
        if (ground) {
            acc = ground_acc;
            frict = ground_frict;
        } else {
            acc = air_acc;
            frict = air_frict;
        }
        
        // gravity
        if (!ground) {
            vsp += grav;
        }
        
        // Horizontal movement
        if (move_x < 0) {
            if (hsp >= -move_speed) {
                hsp = approach(hsp, move_speed * move_x, acc);
            } else {
                hsp = approach(hsp, move_speed * move_x, frict);
            }
        } else {
            if (move_x > 0) {
               if (hsp <= move_speed) {
                hsp = approach(hsp, move_speed * move_x, acc);
               } else {
                hsp = approach(hsp, move_speed * move_x, frict);				
               }
            }
		}		
            
        // Vertical movement
        if (move_y < 0) {
            if (vsp >= -move_speed) {
                vsp = approach(vsp, move_speed * move_y, acc);
            } else {
                vsp = approach(vsp, move_speed * move_y, frict);
            }
        } else {
            if (move_y > 0) {
               if (vsp <= move_speed) {
                vsp = approach(vsp, move_speed * move_y, acc);
               } else {
                vsp = approach(vsp, move_speed * move_y, frict);
               }
            }
		}
            
        // Check for walls
        if (wall_jump && !ground) {
            cling_left = place_meeting(x - 1, y, o_collision_parent);
            cling_right = place_meeting(x + 1, y, o_collision_parent);
            if (cling_left || cling_right) {
                state = state.wall_slide;
                break;
            }
        } else {
            cling_left = false;
            cling_right = false;
        }
        
        // Friction
        if (move_x == 0) {
            hsp = approach(hsp, 0, frict);
        }
        if (move_y == 0 && grav == 0) {
            vsp = approach(vsp, 0, frict);
        }
        
        // Jumping
        if (ground) jumps = 1;
        if (move_jump) {
            if (ground) {
                // Ground jump
                vsp = -jump_height*move_jump;
                ground = false;
                jumps = 1;
            } else {
                // Air jump (double jump) -- check how many times we can jump
                if (jumps++ < jumps_max) {
                    vsp = -djump_height * move_jump;
                }
            }
            move_jump = 0;
        }
        break;
        
    case state.wall_slide:
		sprite_state = SPRITE.wall_slide;
        // Face the correct direction
        if (cling_left) facing = 1; else facing = -1;
        //Check if the wall is still there!
        if (ground ||
           (cling_left && !place_meeting(x - 1, y, o_collision_parent)) ||
           (cling_right && !place_meeting(x + 1, y, o_collision_parent))) {
                cling_left = false;
                cling_right = false;
                state = state.normal;
                break;
        }
        
        // grav_ity
        if (!ground) {
            if (vsp >= 0) {
                vsp = approach(vsp, slide_speed, grav_slide);
            } else {
                vsp += grav;
            }
        }
        
        // Unsticking from the wall
        if (!ground) {
            if ((move_x > 0 && cling_left) || (move_x < 0 && cling_right)) {
                if (stuck_time++ >= stick_time) {
                    state = state.normal;
                    break;
                }
            } else {
                stuck_time = 0;
            }
        }
        
        // Wall jumping
        if (move_jump) {
            var jump_up_wall = -jump_height * move_jump;
            var jump_off_wall = jump_height * 0.45;
            if (cling_left) {
                // Jump off left wall
                if (move_x < 0) {
                    vsp = jump_up_wall;
                    hsp = jump_off_wall;
                } else {
                    vsp = -jump_height;
                    hsp = move_speed;
                }
            } else
            if (cling_right) {
                // Jump off right wall
                if (move_x > 0) {
                    vsp = jump_up_wall;
                    hsp = -jump_off_wall;
                } else {
                    vsp = -jump_height;
                    hsp = -move_speed;
                }
            }
            jumps = 1;
            move_jump = 0;
            state = state.normal;
            break;
        }
        break;
        
    case state.ledge_grab:
        // Unsticking from the ledge by moving horizontally
        if (move_x < 0) {
            if (facing == 1) {
                if (++ledge_stuck > ledge_stick) {
                    state = state.normal;
                    break;
                }
            } else {
                move_x = 0;
            }
        } else
        if (move_x > 0) {
            if (facing == -1) {
                if (++ledge_stuck > ledge_stick) {
                    state = state.normal;
                    break;
                }
            } else {
                move_x = 0;
            }
        } else { // If not moving horizontally, reset ledge stuck timer
            ledge_stuck = 0;
        }
        
        // Jump off
        if (move_jump) {
            vsp = -djump_height;
            move_jump = false;
            state = state.normal;
            break;
        }
        
        // Unsticking by hitting down
        if (fallthrough) {
            state = state.normal;
        }
        
        // Check if the block we're grabbing still exists, if not... release!
        if (!instance_exists(ledge_grab_block)) {
            state = state.normal;
            break;
        } else
            // Check for collisions with other blocks which would stop us from grabbing this block
            if (collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_bottom + 1, o_collision_parent, true, true)) {
                state = state.normal;
                x = xprevious;
                y = yprevious;
            } else { // Stick to & face the block we're grabbed on to
                if (ledge_grab_block.x < x) facing = -1 else facing = 1;
                x = ledge_grab_block.x + ledge_grab_x;
                y = ledge_grab_block.y + ledge_grab_y;
            }
            
        break;
}

// Check for grabbing a ledge
if (state == state.normal || state == state.wall_slide)
if (can_grab && vsp > 0 && !fallthrough && move_x != 0) {
    //Set our grab points
    var gx = x + move_x * 8;
    var gy = bbox_top + 4;
    // Find the block in front of us (if any)
    var xx = x + hsp + move_x;
    var yy = y - 2;
    var block = instance_place(xx, yy, o_collision_parent);
    if (block != noone) {
        var grab_block = true;
        with (block) {
            // Make sure the block is within the confines of the room
            if (bbox_right < 0 || bbox_left > room_width ||
                bbox_bottom < 0 || bbox_top > room_height) {
                    grab_block = false;
            } else
            // Make sure there's not a block above this one
            if (place_meeting(x, y - 1, o_collision_parent)) {
                grab_block = false;
            }
        }
        
        if (grab_block) {
            // Set the block's grab points
            var target_gx = block.bbox_left;
            if (move_x < 0) target_gx = block.bbox_right;
            target_gy = block.bbox_top;
            // Check if the grab points are in the correct positions
            if (gy > target_gy - 3 && gy < target_gy + 3 && !place_meeting(x, y, o_semi_solid_parent)) {
                state = state.ledge_grab;
                // Set x and y positions
                var w = round((bbox_right-bbox_left) / 2) + 2;
                x = block.bbox_left - w;
                if (move_x < 0) x = block.bbox_right + w;
                y = block.bbox_top + (bbox_bottom-bbox_top) - 2;
                // Stop moving!
                vsp = 0;
                hsp = 0;
                move_x = 0;
                move_y = 0;
                // No more clinging to that wall for you
                cling_left = false;
                cling_right = false;
                // Set ledge grab position relative to the block
                ledge_grab_x = x - block.x;
                ledge_grab_y = y - block.y;
                ledge_grab_block = block;
            }
        }
    }
}


