presswait--; // decrease timer between mouse presses

if (mouse_check_button_pressed(mb_left)) { // reset counter when mouse is pressed
    presswait = 5;
}

// handles amount of time between HUD changes
if (!instance_exists(oMessage)) {
    if (emptied > 0) {
        emptied--;
    }
} else {
    emptied = room_speed / 2;
}

__background_set( e__BG.Index, 0, bg_Editor ); // set the background to our editor background

shift = 64; // shift in object placement (their size)

title = ""; // title of the room

switch (mode) { // switch between titles
    case (0):
        title = "Online Level Editor";
        editing = false; // allow for editing
        break;
    case (2):
        title = "Load Level";
        break;
    case (3):
        title = "Edit Level";
        break;
}

draw_set_font(font_Scores); // set the title font
draw_set_halign(fa_center); // align text horizontally
draw_set_valign(fa_top); // align text vertically at the top
draw_set_color(c_white); // set the color to white
draw_set_alpha(0.9); // make text slightly transparent for visual appeal
draw_text(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) / 4, string_hash_to_newline(title)); // draw the title
draw_set_alpha(1);

if (mode == 0) { // if we are on the menu 
    global.TESTING = false;
    draw_set_font(font_Text);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(16, 16, string_hash_to_newline("Zack Banack - Version 1.0 created on 06/02/2015#http://zackbanack.com/"));
    draw_set_halign(fa_center);
    draw_set_font(font_Text); // set the font to the options font
    draw_set_valign(fa_bottom); // align text vertically at the bottom
    // draw the options
    draw_text(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) - (__view_get( e__VW.HView, 0 ) / 4), string_hash_to_newline("N - New Level#L - Load Levels#E - Edit Level#Esc - Quit"));
    draw_set_alpha(1); // reset alpha

    if global.textActive == false {
        if (keyboard_check_pressed(vk_anykey)) { // check if a key is pressed
            switch (keyboard_lastkey) { // switch between the last pressed key and change modes based on press and spawn necessary text fields
                case (ord("N")):
                    mode = 1;
                    clearMap(); // reset the map
                    add_textfield(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - (padding_right * spacing), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom * spacing) / 2) - spacing / 2, fa_right, font_Text, 0);
                    add_textfield(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - (padding_right * spacing), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom * spacing) / 2), fa_right, font_Text, 1);
                    add_textfield(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - (padding_right * spacing), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom * spacing) / 2) + spacing / 2, fa_right, font_Text, 2);
                    break;
                case (ord("L")):
                    mode = 2;
                    break;
                case (ord("E")):
                    mode = 3;
                    clearMap(); // reset the map
                    add_textfield(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom * spacing) / 2) - spacing * 3, fa_center, font_Text, 0);
                    add_textfield(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom * spacing) / 2) - spacing * 2, fa_center, font_Text, 1);
                    add_textfield(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom * spacing) / 2) - spacing, fa_center, font_Text, 2);
                    break;
                case (vk_escape):
                    clearTexts(); // clear the texts
                    game_end(); // end the game
                    break;
            }
        }
    }
} else if (mode == 1) { // if we are in the level editor
    global.TESTING = true; // in TESTING mode - level is not live
    if (!instance_exists(oMessage) && emptied <= 0) { // if we are able to press after 1/2 second grace period
        if keyboard_check_pressed(vk_left) {
            if (start > 0) { // if we can shift the HUD, aka the "start" of the list of objects isn't invalid
                start--;  // shift to the left
                selected--; // change the selected object
            }
        } else if keyboard_check_pressed(vk_right) {
            if start < counter - 1 {// shift the HUD to the right
                start++; // increase the start object
                selected++; // change the selected object
            }
        } else if keyboard_check_pressed(vk_escape) { // if escape is pressed, clear the texts and return to the menu
            clearTexts();
            mode = 0;
        }
    }

    draw_set_color(c_white); // set the color to white
    draw_set_alpha(0.5); // make the grid spots half transparent
    // loop vertically and horizontally to render the grid spaces
    data = ""; // data is empty by default
    cc = 0; // counter variable
    for (var i = 0; i < counter; i++) { // cycle through objects
        countobj[i] = 0; // set the instance count to 0
    }
    // **Must be in separate loop as objects are not updated the same frame**
    for (var i = 0; i < horSize; i++) { // loop through the grid horizontally
        for (var j = 0; j < vertSize; j++) { // loop through the grid vertically
            if (pos[(j * horSize) + i]) != -1 { // if the spot is not empty
                countobj[pos[(j * horSize) + i]] += 1; // increase the instance count by one
            }
        }
    }
    for (var i = 0; i < horSize; i++) { // loop through the grid horizontally
        for (var j = 0; j < vertSize; j++) { // loop through the grid vertically
            // draw grid space
            draw_rectangle(((padding_left * spacing) + ((i) * spacing)) + border, ((padding_top * spacing) + ((j) * spacing)) + border, ((padding_left * spacing) + ((i + 1) * spacing)) - border, ((padding_top * spacing) + ((j + 1) * spacing)) - border, true);

            // object placement - if our mouse is over a grid space
            if (!instance_exists(oMessage) && emptied <= 0) {
                if (mouse_x > ((padding_left * spacing) + (i * spacing)) && mouse_x < ((padding_left * spacing) + ((i + 1) * spacing)) && mouse_y > ((padding_top * spacing) + (j * spacing)) && mouse_y < ((padding_top * spacing) + ((j + 1) * spacing))) {
                    if (mouse_check_button(mb_left)) {
                        if ((countobj[selected] < maxobj[selected])) { // if the max number of instances has not been exceeded
                            pos[(j * horSize) + i] = selected; // change the grid space to the object we currently have selected
                            tested = false; // level has not been tested - there has been an update
                        } else {
                            if (presswait == 5) { // after a slight delay, display a message (this delay prevents mouse dragging spamming the dialogue)
                                message("You cannot place any more of this object.");
                            }
                        }
                    } else if (mouse_check_button(mb_right)) { // clearing an object
                        pos[(j * horSize) + i] = -1; // set the value to -1
                        tested = false; // again, an update, so we must text
                    }
                }
            }

            if (pos[(j * horSize) + i] != -1) { // if the current grid space is not empty, draw the proper sprite in it
                draw_sprite_ext(sprite[pos[(j * horSize) + i]], 0, (padding_left * spacing) + (i * spacing), (padding_top * spacing) + (j * spacing), 1, 1, 0, c_white, 1);
            }

            temp = pos[cc]; // temporary data value - specific grid value

            data += string(temp) + ","; // append the grid value to our list of data
            cc++; // increase the counter
        }
    }
    draw_set_alpha(1); // reset alpha

    draw_set_font(fntTiny);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_text(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + ((padding_top * spacing) / 2), string_hash_to_newline("LEVEL EDITOR // Left Mouse - Select/Place Object, Text Field // Right Mouse - Delete Object // P - Play Level //#S - Save Level & Upload // Left/Right Arrow - Navigate Objects // R - Reset // Esc - Menu"));
    draw_set_font(fntDetails); // set the details font
    draw_set_halign(fa_right); // align text horizontally to the right
    draw_set_valign(fa_center); // align text vertically

    endy = counter; // the end of our HUD list

    // cap object shifting
    if (endy > start + floor(horSize / 2)) {
        endy = start + floor(horSize / 2);
    }

    if (counter > horSize - 3) { // if the HUD exceeds a number of objects...
        draw_set_halign(fa_center); // center the text and draw the number of objects shown out of how many there are
        draw_text_transformed(__view_get( e__VW.XView, 0 ) + ((padding_left * 0.5) * spacing), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom / 2) * spacing), string_hash_to_newline(string(endy) + "/" + string(counter)), 0.5, 0.5, 0);
    }

    for (var i = start; i < endy; i++) { // cycle through the list of HUD objects
        // if the object is selected, give it a yellow, transparent outline
        if (selected == i) {
            draw_set_color(c_yellow);
            draw_set_alpha(0.5);
            draw_rectangle(-(start * spacing) + __view_get( e__VW.XView, 0 ) + ((padding_right + i) * spacing) - border, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom / 2) * spacing) - (sprite_get_height(sprite[i]) / 2) - border, -(start * spacing) + __view_get( e__VW.XView, 0 ) + ((padding_right + (i + 1)) * spacing) + border, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom / 2) * spacing) + (sprite_get_height(sprite[i]) / 2) + border, false);
            draw_set_alpha(1);
        }
        // draw the actual sprite
        draw_sprite_ext(sprite[i], 0, -(start * spacing) + __view_get( e__VW.XView, 0 ) + ((padding_right + i) * spacing) + (sprite_get_height(sprite[i])) / 4, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom / 2) * spacing) - (sprite_get_height(sprite[i]) / 2) / 2, 0.5, 0.5, 0, c_white, 1);

        // if the mouse is pressed on a HUD object, make it our selected object
        if ((mouse_check_button(mb_left) && !instance_exists(oMessage)) && emptied <= 0) {
            if (mouse_y > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom / 2) * spacing) - (sprite_get_height(sprite[i]) / 2)) &&
                (mouse_y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - ((padding_bottom / 2) * spacing) + (sprite_get_height(sprite[i]) / 2)) {
                    if ((mouse_x > __view_get( e__VW.XView, 0 ) + ((padding_right + (i - start)) * spacing)) && (mouse_x < __view_get( e__VW.XView, 0 ) + ((padding_right + ((i - start) + 1)) * spacing))) {
                        selected = i;
                    }
                }
        }
    }

    draw_set_alpha(0.25); // transparency
    draw_set_color(c_white); // set the color to white

    if (global.textActive == 0 && !instance_exists(oMessage)) && emptied <= 0 { // if no text is selected, a message does exist and the objects can update
        if keyboard_check_pressed(ord("P")) { // press the play button
            temp = data; // set the temp data to the data
            data = "<name>" + string(levelName) + "</name><author>" + string(levelAuthor) + "</author><map>" + string(temp) + "</map>"; // reformat data
            passCheck = true; // check variable

            // check if objects exceed their min count, if not, disallow check
            for (var i = 0; i < counter; i++) {
                if (countobj[i] < minobj[i]) {
                    passCheck = false;
                }
            }

            // if the check is passed, change the mode to play mode
            if (passCheck == true) {
                mode = 5;
                loaded = false;
                tested = true;
            } else {
                message("Ensure both a Player and a Finish object are placed in the room."); // throw an error
            }

        } else if (keyboard_check_pressed(ord("S"))) { // if the save button is pressed
            // if the default names and author are used, do not let it pass
            if (string_length(password) > 0 && string_length(levelName) > 0 && levelName != "Level Name" && string_length(levelAuthor) > 0 && levelAuthor != "Your Name") {
                if tested == true { // if the level has been tested
                    post_data = url_encode(string(data)); // encode the level data
                    post_author = url_encode(levelAuthor); // encode the level author
                    post_level = url_encode(levelName); // encode the level name
                    post_auth = url_encode(md5_string_utf8(data + salt)); // authenticate the level using its data and salt in MD5 hashing
                    post_id = md5_string_utf8(url_encode(levelAuthor) + url_encode(levelName) + url_encode(salt)); // level ID, created using author name, level, salt in MD5 hasing
                    post_password = md5_string_utf8(string(password) + string(salt)); // password is password + salt hashed MD5

                    // format the URL
                    format = string(BASEURL) + "/post.php?map=" + string(post_data) + "&name=" + string(post_level) + "&author=" + string(post_author) + "&verify=" + string(md5_string_utf8(string(post_data) + string(salt))) + "&id=" + string(post_id) + "&password=" + string(post_password) + "&verify=" + string(post_auth);

                    get = http_get(format); // send the request
                } else {
                    message("Test your level before submitting!"); // throw an error
                }
            } else {
                message("Please enter valid level information."); // throw an error
            }
        } else if keyboard_check_pressed(ord("R")) { // reset the room
            clearMap();
        }
    }


} else if (mode == 5) { // if the mode is play mode
    __background_set( e__BG.Index, 0, bg_Levels ); // change the background
    if (loaded == false) { // if not loaded, load
        loaded = true;
        //instance_create(0, 0, oCamera); // create the camera
        levelName = string(split(data, "name")); // get the name
        levelAuthor = string(split(data, "author")); // get the author
        map = string(split(data, "map")); // get the map data

        string_explode(map, ","); // explode the map

        cc = 0; // counter variable
        for (j = 0; j < vertSize; j++) { // loop through grid horizontally
            for (i = 0; i < horSize; i++) { // loop through grid vertically
                if (real(mapData[cc]) != -1) { // if grid space is occupied
                    // create the specific object based on grid space occupation
                    instance_create((padding_left * spacing) + (i * spacing), (padding_top * spacing) + (j * spacing), object[real(mapData[cc])]);
                }
                cc++; // increase the counter variable
            }
        }
    }

    // if escape is pressed, based on the mode, return the user to the menu
    if (keyboard_check_pressed(vk_escape)) {
        selected = false;
        if global.TESTING == true {
            mode = 1;
        } else {
            mode = 2;
        }
        // reset the view
        __view_set( e__VW.XView, 0, 0 );
        __view_set( e__VW.YView, 0, 0 );
        // cycle through all the objects and delete them if they belong in the editor or are camera objects
        with(all) {
            if (object_index != oTextField) {
                for (i = 0; i < oEditor.counter; i++) {
                    if (object_index == oEditor.object[i]) {
                        instance_destroy();
                    }
                }
            }
        }
    }

    // draw the level information (level name and author) in the top center of the view
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_set_font(fntOptions);
    draw_set_color(c_black);
    draw_text_transformed(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + (padding_top * spacing) / 2, string_hash_to_newline(string(levelName) + " by " + string(levelAuthor)), 0.5, 0.5, 0);

} else if (mode == 2) {
    clearTexts();
    loadedCount = 0;
    loadProcess = 0;
    draw_set_color(c_white); // set the color to white
    draw_set_alpha(0.9); // make text slightly transparent for visual appeal
    draw_set_font(fntOptions); // set the font to the options font
    draw_set_valign(fa_bottom); // align text vertically at the bottom
    // draw the options
    draw_set_halign(fa_center);
    draw_text(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) - (__view_get( e__VW.HView, 0 ) / 4), string_hash_to_newline("1 - Newest to Oldest#2 - Alphabetical Order#3 - Search by Letter#4 - Search String#Esc - Back"));
    draw_set_alpha(1); // reset alpha   
    if (keyboard_check_pressed(vk_anykey)) { // check if a key is pressed
        switch (keyboard_lastkey) { // switch between the last pressed key and change modes based on press
            case (ord("1")):
                mode = 11;
                break;
            case (ord("2")):
                mode = 12;
                break;
            case (ord("3")):
                mode = 13;
                break;
            case (ord("4")):
                mode = 14;
                break;
            case (ord("5")):
                mode = 15;
                break;
            case (vk_escape):
                clearTexts(); // clear the text boxes
                mode = 0; // go to defsult menu
                break;
        }
    }

    ableSearch = true; // ability to search again is true
    resultsLoaded = false; // results have not been loaded
}else if (mode == 3) { // level edit mode
    // return us to the main menu
    if (keyboard_check_pressed(vk_escape)) {
        clearTexts();
        mode = 0;
    }

    // if enter is pressed and fields are filled
    if (keyboard_check_pressed(vk_enter) && global.textActive == 0 && string_length(password) > 0 && string_length(levelAuthor) > 0 && string_length(levelName) > 0) {
        post_author = url_encode(levelAuthor); // encode the author name
        post_level = url_encode(levelName); // encode the level
        post_id = md5_string_utf8(url_encode(levelAuthor) + url_encode(levelName) + url_encode(salt)); // get the level ID and form it using md5
        post_password = md5_string_utf8(string(password) + string(salt)); // encode the level password using Md5
        holdPass = password;
        format = string(BASEURL) + "/pull.php?Type=5&Search=" + string(post_id) + "&password=" + string(post_password); // format the URL
        fetchEdit = http_get(format); // send the request
    }
} else if (mode == 11) { // sort newest - oldest
    // clear texts and change mode if escape is pressed
    if (keyboard_check_pressed(vk_escape)) {
        clearTexts();
        mode = 2;
    }

    if (ableSearch) { // if we are able to search
        ableSearch = false;// pause new searching

        fetchData = http_get(string(BASEURL) + "/pull.php?Type=1"); // send request

    }
} else if (mode == 12) { // sort ABC order
    // clear texts and change mode if escape is pressed
    if (keyboard_check_pressed(vk_escape)) {
        clearTexts();
        mode = 2;
    }

    if (ableSearch) { // if we are able to search
        ableSearch = false; // pause new searching

        fetchData = http_get(string(BASEURL) + "/pull.php?Type=2"); // send request
    }
} else if (mode == 13) { // search by letter
    // if the user presses escape, clear the texts, change the mode, reformat searching
    if (keyboard_check_pressed(vk_escape)) {
        clearTexts();
        mode = 2;
        selectedLetter = false;
        letter = "A";
    }

    if (ableSearch && selectedLetter) { // if we are able to search and we selected a letter
        ableSearch = false; // stop ability to do a new search while fetching

        fetchData = http_get(string(BASEURL) + "/pull.php?Type=3&Search=" + string(letter)); // send a fetch request
    }

    // format font
    draw_set_font(fntMessage);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_set_alpha(1);
    draw_set_color(c_white);
    for (i = 0; i < 26; i++) { // cycle through alphabet and copy character
        txt = string_copy("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i + 1, 1);
        draw_text(((__view_get( e__VW.WView, 0 ) / 26) * i) + 16, 32, string_hash_to_newline(txt)); // draw character
        // if mouse is within range of a character and the button is pressed, send a request with that character...
        if (point_distance(mouse_x, mouse_y, ((__view_get( e__VW.WView, 0 ) / 26) * i) + 16, 32) < 24) {
            if mouse_check_button_released(mb_left) {
                selectedLetter = true; // letter is selected
                ableSearch = true; // we are able to send a search request
                letter = txt; // set letter to the text
                resetResults(); // reset the results so they are fresh
            }
        }
    }
} else if (mode == 14) { // search by string
    // create a field for our search if one does not exist
    if (!instance_exists(oTextField)) {
        add_textfield(16, 16, fa_left, fntMessage, 14);
    }

    if (ableSearch && validString) { // if we are able to search and the string we searched is valid
        ableSearch = false; // stop ability to do a new search while fetching

        fetchData = http_get(string(BASEURL) + "/pull.php?Type=4&Search=" + string(searchString)); // send a fetch request
    }

    // if the user presses escape, clear the texts, change the mode, reformat searching
    if (keyboard_check_pressed(vk_escape)) {
        clearTexts();
        mode = 2;
        validString = false;
        searchString = "";
    }
}

if (mode >= 11 && mode <= 15) { // if in searching modes
    draw_set_halign(fa_left); // set the halign
    draw_set_valign(fa_top); // set the valign
    draw_set_font(fntOptions); // set the font
    if (resultsLoaded == true) { // if the results are loaded
        if (loadedCount > 0) { // if the number of results is greater than 0
            for (i = 0; i < loadedCount; i++) { // cycle
                if (i % 2) { // modulus for background pattern
                    draw_set_alpha(0.1);
                } else {
                    draw_set_alpha(0.2);
                }
                draw_rectangle(48, 64 + (64 * i), __view_get( e__VW.WView, 0 ) - 48, 64 + (64 * (i + 1)) - 1, false); // draw rectangle
                draw_set_alpha(1); // reset alpha
                draw_text(64, 64 + (64 * i) + 8, string_hash_to_newline(string(resultName[i]) + " by " + string(resultAuthor[i]))); // draw text

                // if the mouse is pressed and within boundaries, begin the load process for the specific level
                if (mouse_check_button_pressed(mb_left)) {
                    if (mouse_x > 64 && mouse_x < __view_get( e__VW.WView, 0 ) - 64) {
                        if (mouse_y > 64 + (64 * i) && mouse_y < 64 + (64 * (i + 1))) {
                            selectedLevel = i;
                            loadProcess = 1;
                        }
                    }
                }
            }
        } else {
            draw_text(64, 64, string_hash_to_newline("No levels avaliable at the moment.")); // no levels available yet
        }
    } else {
        if (mode == 11 or mode == 12) {
            // display loading text while the program loads the results and presents them from the server
            draw_set_font(fntOptions);
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            draw_text(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) / 2, string_hash_to_newline("Loading..."));
        }
    }

    txt = ""; // changes depending on the results we want

    switch (mode) { // switch between the modes
        case (11):
            txt = "Sorting Levels From Newest to Oldest";
            break;
        case (12):
            txt = "Sorting Levels in Alphabetical Order";
            break;
        case (13):
            txt = "Showing Levels Starting With a Particular Character";
            break;
        case (14):
            txt = "Showing Levels (and Their Authors) Containing a Particular String";
            break;
    }

    draw_set_font(fntMessage);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text(__view_get( e__VW.WView, 0 ) - 32, __view_get( e__VW.HView, 0 ) - 32, string_hash_to_newline(txt)); // draw the mode type

    if (loadProcess == 1) { // if the load process has begun
        loadProcess = 2; // change the process
        data = ""; // empty the data
        temp = ""; // empty temp
        string_explode(resultMap[selectedLevel], ","); // explode the map data

        cc = 0; // simple counter variable for iteration
        for (j = 0; j < vertSize; j++) { // loop through grid vertically
            for (i = 0; i < horSize; i++) { // loop through grid vertically
                if real(mapData[cc]) != -1 { // if the map value is not -1 (empty)
                    pos[cc] = real(mapData[cc]); // set the map position to the map value
                }
                cc++; // increase the counter
            }
        }

        levelAuthor = resultAuthor[selectedLevel]; // get author name
        levelName = resultName[selectedLevel]; // get level name

        // reformat pulled data with empty map string - we are now using an array
        data = "<name>" + string(levelName) + "</name><author>" + string(levelAuthor) + "</author><map>" + string(temp) + "</map>";
        loaded = false; // level is not fully loaded yet
        mode = 5; // switch the mode to play mode where objects will be spawned
    }
}

