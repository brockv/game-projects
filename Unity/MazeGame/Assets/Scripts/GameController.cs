using System;
using UnityEngine;
using UnityEngine.UI;

// Ensure the MazeConstructor script is added to the same object as this script
[RequireComponent(typeof(MazeConstructor))]

public class GameController : MonoBehaviour
{
    //1
    [SerializeField] private FirstPersonAIO player;
    [SerializeField] private Text timeLabel;
    [SerializeField] private Text scoreLabel;

    private MazeConstructor generator;

    //2
    private DateTime startTime;
    private int timeLimit;
    private int reduceLimitBy;

    private int score;
    private bool goalReached;

    public Vector3 StartPosition
    {
        get; private set;
    }

    public int SafeRow
    {
        get; private set;
    }

    public int SafeCol
    {
        get; private set;
    }

    private void Start()
    {
        // Store a reference to MazeConstructor and start the game
        generator = GetComponent<MazeConstructor>();
        StartNewGame();
    }

    /**
     * Starts a new game, resetting the time limit and score, and making a call to StartNewMaze.
     */
    private void StartNewGame()
    {
        timeLimit = 80;
        reduceLimitBy = 5;
        startTime = DateTime.Now;

        score = 0;
        scoreLabel.text = score.ToString();

        //StartPosition = new Vector3(3.8f, 1.0f, 3.8f);

        StartNewMaze();
    }

    /**
     * Starts a new maze, while also resetting the player's position and the timer.
     */
    private void StartNewMaze()
    {
        // Cancel the invoke to prevent overlap
        //CancelInvoke("TeleportPlayer");

        // Generate a new maze with the given dimensions
        //int row = (int)generator.StartRow / (int)generator.HallWidth;
        //int col = (int)generator.StartCol / (int)generator.HallWidth;
        generator.GenerateNewMaze(15, 17, OnStartTrigger, OnGoalTrigger);

        // Reset the player's position to the start location
        float x = generator.StartCol * generator.HallWidth;
        float y = 1;
        float z = generator.StartRow * generator.HallWidth;
        player.transform.localPosition = new Vector3(x, y, z);
        //player.transform.position = StartPosition;

        // Reset the goal flag and enable the player
        goalReached = false;
        player.enabled = true;

        // Reduce the timer and set the start time
        timeLimit -= reduceLimitBy;
        startTime = DateTime.Now;

        // Call TeleportPlayer in 10 seconds, and every 10 seconds after that
        //InvokeRepeating("TeleportPlayer", 2.0f, 2.0f);
    }

    /**
     * Print the maze data that was generated to the GUI.
     */
    void OnGUI()
    {
        // Get the maze data, as well as the max row and column values
        int[,] maze = generator.Data;
        int rMax = maze.GetUpperBound(0);
        int cMax = maze.GetUpperBound(1);

        // Initialize an empty string to store the output
        string msg = "";

        // Iterate over the maze data, adding '....' for open spaces, and '==' for walls
        for (int i = rMax; i >= 0; i--)
        {
            for (int j = 0; j <= cMax; j++)
            {
                // The current cell is a 0 (an empty space)
                if (maze[i, j] == 0)
                {
                    msg += "....";
                }
                // The current cell is a 1 (a wall)
                else
                {
                    msg += "==";
                }
            }
            // Move to a new line after each row
            msg += "\n";
        }

        // Print the output to the GUI
        GUI.Label(new Rect(20, 20, 500, 500), msg);
    }

    /**
     * Teleports the player to a random open space in the maze.
     */
    private void TeleportPlayer()
    {
        // Generate a new maze
        //float row = player.transform.position.x / generator.HallWidth;
        //float col = player.transform.position.z / generator.HallWidth;
        //generator.GenerateNewMaze(15, 17, OnStartTrigger, OnGoalTrigger);

        // Find a random open space in the new maze
        generator.FindOpenSpace();

        // Move the player to the space we found
        player.transform.position = new Vector3(generator.OpenRow * generator.HallWidth, 1.0f, generator.OpenCol * generator.HallWidth);
    }

    void Update()
    {
        // If the player isn't enabled, don't update the timer
        if (!player.enabled)
        {
            return;
        }

        // Display the cell the user is currently in
        int row = (int)player.transform.position.x / (int)generator.HallWidth;
        int col = (int)player.transform.position.z / (int)generator.HallWidth;
        //Debug.Log("PLAYER IS IN CELL: " + row + "," + col);
        //Debug.Log("MAP DATA AT PLAYER CELL: " + generator.Data[row, col]);

        // If the player fell through the map somehow, move them to an open space in the maze
        if (player.transform.position.y < 0.5f)
        {
            // Find a random open space in the current maze
            generator.FindOpenSpace();

            Vector3 newPosition = new Vector3(generator.OpenRow * generator.HallWidth, 1.0f, generator.OpenCol * generator.HallWidth);           
            player.transform.position = newPosition;
        }

        // Reduce the remaining time
        int timeUsed = (int)(DateTime.Now - startTime).TotalSeconds;
        int timeLeft = timeLimit - timeUsed;

        // If there is still time remaining, display the updated value
        if (timeLeft > 0)
        {
            timeLabel.text = timeLeft.ToString();
        }
        // The player ran out of time -- change the display and start the game over
        else
        {
            timeLabel.text = "TIME UP";
            player.enabled = false;

            Invoke("StartNewGame", 4);
        }
    }

    /**
     * Triggered when the player touches the goal object.
     */
    private void OnGoalTrigger(GameObject trigger, GameObject other)
    {
        Debug.Log("Goal!");
        goalReached = true;

        score += 1;
        scoreLabel.text = score.ToString();

        Destroy(trigger);

        player.enabled = false;
        StartNewMaze();
        //ResetPlayerPosition();
    }

    /**
     * Triggered when the player touches the start object.
     */
    private void OnStartTrigger(GameObject trigger, GameObject other)
    {
/*        if (goalReached)
        {
            Debug.Log("Finish!");
            player.enabled = false;

            Invoke("StartNewMaze", 4);
        }*/
    }

    private void ResetPlayerPosition()
    {
        float x = generator.StartCol * generator.HallWidth;
        float y = 1;
        float z = generator.StartRow * generator.HallWidth;
        player.transform.position = new Vector3(x, y, z);
        //player.transform.position = StartPosition;

        //Invoke("StartNewMaze", 1);
        //InvokeRepeating("StartNewMaze", 2.0f, 10.0f);
    }
}
