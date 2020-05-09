total = 0; // counter variable

// cycle through all the text fields, if active, increase the counter by one
with(all) {
    if (object_index == oTextField) {
        if (in == true) {
            oEditor.total++;
        }
    }
}

// if any text fields are active, mark global.textActive as such
if (total > 0) {
    global.textActive = true;
} else {
    global.textActive = false;
}

