// if the editor does not exist, delete
// remove this line of code if you plan on using this text field outside of the editor
if (!instance_exists(oEditor)) {
    instance_destroy();
}

if (locked == false) { // if the field can be edited
    if (mouse_check_button_pressed(mb_left)) { // if the mouse is pressed within bounds
        if (mouse_x > x && mouse_x < x + width && mouse_y > y && mouse_y < y + height) {
            if ( in == false) { // if box is not being edited
                in = true; // activate box
                refresh = true; // refresh the box
            }
        } else {
            in = false; // no longer active
            update = true; // call to make changes to the box
        }
    }

    width = oEditor.MAXLENGTH * font_get_size(font); // get the width of the box
    height = font_get_size(font); // get the height of the box

    if (halign == fa_center) { // if the horizontal alignment is centered, shift the box
        x = __view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2) - width / 2;
    } else if (halign = fa_right) { // if the alignment is to the right, shift the box the entire width
        if swap = false {
            swap = true;
            x = x - width;
        }
    }


    if (in == true) { // if the box is active
        if (string_length(keyboard_string) > oEditor.MAXLENGTH) { // if the string is too long
            keyboard_string = string_copy(keyboard_string, 1, oEditor.MAXLENGTH); // copy and cut the keyboard input
        }

        text = keyboard_string; // set the text to the keyboard input 
        if (keyboard_check_pressed(vk_enter)) { in = false; // enter acts as updating the text and deactivating the box
            update = true;
        }
    } else { // cases for each box (ID) with the scenerio of an empty string
        switch (ID) {
            case (0):
                if text == "" {
                    oEditor.levelName = "Level Name";
                    text = oEditor.levelName
                };
                break;
            case (1):
                if text == "" {
                    oEditor.levelAuthor = "Your Name";
                    text = oEditor.levelAuthor
                };
                break;
            case (14):
                if text == "" {
                    oEditor.searchString = "Search";
                    text = oEditor.searchString
                };
                break;
        }
    }

    pass = true; // small test to check if we are updating a box with results feeding to our database

    // change the "64" if you plan on moving the input box lower on the screen. 
    // basically, we do not want updates to occur when the mouse is too far away from the box because
    // clicking will cause a refresh, something we do not want when trying to click loaded results
    if (ID == 14 && mouse_y > 64) {
        pass = false;
    }

    if (update == true && pass == true) { // if the test is passed and there is an update
        update = false; // stop the update (updates are rapid)
        switch (ID) { // cases for each box (ID) to update the text and respective variables
            case (0):
                oEditor.levelName = text;
                break;
            case (1):
                oEditor.levelAuthor = text;
                break;
            case (2):
                oEditor.password = text;
                break;
            case (14):
                oEditor.searchString = text;
                oEditor.validString = true;
                oEditor.ableSearch = true;
                with(oEditor) {
                    resetResults();
                };
                break;
        }
    }

    if (refresh == true) { // refresh, like update, but occurs when the box is clicked on
        refresh = false;
        switch (ID) { // cases for each box (ID) to update the text on default cases
            case (0):
                if oEditor.levelName == "Level Name" {
                    oEditor.levelName = ""
                };
                text = oEditor.levelName;
                keyboard_string = text;
                break;
            case (1):
                if oEditor.levelAuthor == "Your Name" {
                    oEditor.levelAuthor = ""
                };
                text = oEditor.levelAuthor;
                keyboard_string = text;
                break;
            case (2):
                text = oEditor.password;
                keyboard_string = text;
                break;
            case (14):
                if oEditor.searchString == "Search" {
                    oEditor.searchString = ""
                };
                text = oEditor.searchString;
                keyboard_string = text;
                break;
        }
    }
} else { 
    in = false;
}

// if a message exists, a text box cannot be active
if instance_exists(oMessage) { 
    in = false;
}

// if the editor is in mode 5, play, hide the boxes and force them to be inactive
// deleting and respawing them would be possible, but restoring their values would be unnecessary work
if oEditor.mode == 5 {
    visible = false;
    in = false;
} else {
    visible = true;
}

