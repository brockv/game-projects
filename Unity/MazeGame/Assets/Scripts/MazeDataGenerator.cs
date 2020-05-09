using System.Collections.Generic;
using UnityEngine;

public class MazeDataGenerator
{
    // Chance of an empty space
    public float placementThreshold;

    public MazeDataGenerator()
    {
        // Used by the data generation algorithm to determine whether a space is empty
        placementThreshold = 0.1f;
    }

    /**
     * Algorithm that generates maze data, using 1's to represent walls and 0's to represent open spaces.
     */
    public int[,] FromDimensions(int numRows, int numCols)
    {
        // Initialize a new array to store the maze data in, using the given values for dimensions
        int[,] maze = new int[numRows, numCols];

        // Grab the upperbound values for both the rows and columns
        int rMax = maze.GetUpperBound(0);
        int cMax = maze.GetUpperBound(1);

        for (int i = 0; i <= rMax; i++)
        {
            for (int j = 0; j <= cMax; j++)
            {
                // For each grid cell, check if it's on the outside of the grid
                if (i == 0 || j == 0 || i == rMax || j == cMax)
                {
                    // If it is, assign it a 1 (for a wall)
                    maze[i, j] = 1;
                }

                // Check if the current coordinates are even in order to work on every other cell
                else if (i % 2 == 0 && j % 2 == 0)
                {
                    // Check to see if we should simply skip this cell (results in an empty space)
                    if (Random.value > placementThreshold)
                    {
                        // If we don't skip this cell, assign a 1 (a wall) to the current cell
                        maze[i, j] = 1;

                        // Assign a 1 (a wall) to a randomly chosen adjacent cell
                        int a = Random.value < .5 ? 0 : (Random.value < .5 ? -1 : 1);
                        int b = a != 0 ? 0 : (Random.value < .5 ? -1 : 1);
                        maze[i + a, j + b] = 1;
                    }
                }
            }
        }

        // Return the maze data that was generated
        return maze;
    }
}
