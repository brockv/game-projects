/// @description resetResults();

listedLevels = 0; // reset the number of levels displayed 
loadedCount = 0; // reset the number of levels counted
for (i = 0; i < 25; i++) {
    resultMap[i] = ""; // reset map data
    resultAuthor[i] = ""; // reset authors
    resultName[i] = ""; // reset level names
    resultDate[i] = ""; // reset dates
}

resultsLoaded = false; // reset loaded boolean
