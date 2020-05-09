/// @description clearMap();
for (var i = 0; i < horSize; i++) {
    for (var j = 0; j < vertSize; j++) {
        pos[(j * horSize) + i] = -1; // clear all grid positions
    }
}
levelName = "Level Name"; // name of the level
levelAuthor = "Your Name"; // author of the level
password = ""; // level password

// object selection HUD
endy = 0; // last object to display
start = 0; // first object to display

selected = 0; // currently selected object

tested = false; // whether or not the level has been tested
