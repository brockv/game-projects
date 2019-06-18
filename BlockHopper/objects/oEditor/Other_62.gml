if (ds_map_find_value(async_load, "id") == fetchEdit) { // if the results for the level edit are present
    if (ds_map_find_value(async_load, "status") == 0) { // if the status does not error
        r_str = ds_map_find_value(async_load, "result"); // assign the results to r_str
        clearMap(); // clear the map
        if (string_length(r_str) > 128) { // check to see if there is content being returned (128 characters is a good amount)
            mode = 1; // set the editing mode to 1 - the level editor
            editing = true; // allow for edititng
            
            clearTexts(); // delete any text fields if they are present

            resultMap[0] = split(r_str, "map"); // grab the map from the result string
            resultAuthor[0] = split(r_str, "author"); // grab the author from the result string
            resultName[0] = split(r_str, "name"); // grab the name from the result string
            
            // update the level information
            levelName = resultName[0];
            levelAuthor = resultAuthor[0];
            password = holdPass;

            string_explode(resultMap[0], ","); // explode the map data into an array

            cc = 0; // simple counter variable for iteration
            for (j = 0; j < vertSize; j++) { // loop through grid vertically
                for (i = 0; i < horSize; i++) { // loop through grid vertically
                    if real(mapData[cc]) != -1 { // if the map value is not -1 (empty)
                        pos[cc] = real(mapData[cc]); // set the map position to the map value
                    }
                    cc++; // increase the counter
                }
            }
            
        // decode the author and name
        resultAuthor[0] = url_decode(resultAuthor[i]);
        resultName[0] = url_decode(resultName[i]);

        } else {
            message("Invalid level credentials."); // no data (or lack of sufficient data) returned - must be incorrect!
        }

    } else {
        r_str = "null"; // error
        if !instance_exists(oMessage){
            message("Something went wrong fetching the data.");
        }
    }
}


if (ds_map_find_value(async_load, "id") == get) { // if the results for the level push are present
    if (ds_map_find_value(async_load, "status") == 0) { // if the status does not error
        r_str = ds_map_find_value(async_load, "result"); // assign the results to r_str
        locked = false; // unlock the text boxes
        switch (real(r_str)) { // switch between the result (numbers)
            case (0): // 0 indicates a failure to connect to the database
                message("Failed to connect to the database.");
                break;
            case (1): // 1 indicates that the level was successfull!
                message("Level successfully uploaded to the database!");
                locked = true; // lock the text boxes
                break;
            case (2): // 2 indicates the authentification was invalid (someone's trying something funny >:|)
                message("Invalid authentification.");
                break; 
            case (3): // 3 indicates the level ID was already taken and the password does not match, so no edit was made
                message("Level ID is already taken so no updates were made because the password was invalid.");
                break;
            case (4): // 4 indicates the level was already in our database, but it has been successfully uploaded
                message("Level successfully updated.");
                locked = true; // lock the text boxes
                break;
        }

        if (locked == true) { // lock the textboxes for level name, level author, and password
            if instance_exists(oTextField) {
                with(oTextField) {
                    if (ID == 0 or ID == 1 or ID == 2) {
                        locked = true;
                    }
                }
            }
        }

    } else {
        r_str = "null"; // error
        if !instance_exists(oMessage){
            message("Something went wrong fetching the data.");
        }
    }
}

// if the results for the level fetches are present and the status does not error
if (ds_map_find_value(async_load, "id") == fetchData && ds_map_find_value(async_load, "status") == 0) {
    results = ds_map_find_value(async_load, "result"); // assign the results to results
    clearMap(); // clear the map
    listedLevels = 0; // empty the number of levels listed

    // get the number of open and closed level brackets
    c1 = string_count(string(symbolOpen) + string(symbolSlash) + "level" + string(symbolClose), results);
    c2 = string_count(string(symbolOpen) + "level" + string(symbolClose), results);

    // ensure they match, otherwise not all the data has been retrieved
    if (c1 == c2) {
        listedLevels = c1;
    }

    // cycle through the levels
    for (var i = 0; i < listedLevels; i++) {

        resultMap[i] = split(results, "map"); // grab the map data
        resultAuthor[i] = split(results, "author"); // grab the level author
        resultName[i] = split(results, "name"); // grab the level name
        resultDate[i] = split(results, "date"); // grab the level date
        
        // remove data from results, continue
        results = string_delete(results, 1, string_pos(string(symbolOpen) + string(symbolSlash) + "level" + string(symbolClose), results));
        
        // increase number of levels by one
        loadedCount++;
        
        // decode the author and name
        resultAuthor[i] = url_decode(resultAuthor[i]);
        resultName[i] = url_decode(resultName[i]);
    }

    resultsLoaded = true; // results are ready to be listed
}

