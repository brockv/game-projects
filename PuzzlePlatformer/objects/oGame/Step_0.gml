/// @description  Debug

// Input variables for debug room traversal
var kRestart, kExit, kPrev, kNext;

kRestart = keyboard_check_pressed(ord("R"))    || gamepad_button_check_pressed(0, gp_select);
kExit    = keyboard_check_pressed(vk_escape);
kPrev    = keyboard_check_pressed(vk_subtract) || gamepad_button_check_pressed(0, gp_shoulderlb);
kNext    = keyboard_check_pressed(vk_add)      || gamepad_button_check_pressed(0, gp_shoulderrb);

if (kRestart)
    room_restart();
if (kExit)
    game_end();
    
// Iterate through rooms backward
if (kPrev) {
    if (room == room_first)
        room_goto(room_last);
    else
        room_goto_previous();
}

// Iterate through rooms forwards
if (kNext) {
    if (room == room_last)
        room_goto(room_first);
    else
        room_goto_next();
}

/// Debug for path based platform
if (mouse_check_button_pressed(mb_left)) {
    if (instance_exists(oPathMover)) {
        with (oPathMover) {
            plen = path_get_length(path);
            path_add_point(path, mouse_x - xstart, mouse_y - ystart, pSpd);
            plennew = path_get_length(path);
            
            pPos = pPos * (plen / plennew);
        }
    }
} 

if (mouse_check_button(mb_left)) {
    if (instance_exists(oPathMover)) {
        with (oPathMover) {
            plen = path_get_length(path);
            path_delete_point(path, path_get_number(path) - 1);
            plennew = path_get_length(path);
            pPos = pPos * (plen / plennew);
                        
            plen = path_get_length(path);
            path_add_point(path, mouse_x - xstart, mouse_y - ystart, pSpd);
            plennew = path_get_length(path);
            pPos = pPos * (plen / plennew);
            
            pMov = false;
        }
    }
} else {
    with (oPathMover)
        pMov = true;
}

with (oPathMover) {
    pSpd += (mouse_wheel_up() - mouse_wheel_down()) * 2;
    pSpd  = clamp(pSpd, 1, 16);
}

