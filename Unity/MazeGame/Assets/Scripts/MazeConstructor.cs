using UnityEngine;

public class MazeConstructor : MonoBehaviour
{
    // Flag for showing debug messages on the GUI in the scene
    public bool showDebug;

    [SerializeField] private Material mazeMat1;
    [SerializeField] private Material mazeMat2;
    [SerializeField] private Material mazeMat3;
    [SerializeField] private Material startMat;
    [SerializeField] private Material treasureMat;

    [SerializeField] private PhysicMaterial physicMaterial;

    private MazeDataGenerator dataGenerator;
    private MazeMeshGenerator meshGenerator;

    public int[,] Data
    {
        get; private set;
    }
    public int[,] OpenSpaces
    {
        get; private set;
    }

    public float HallWidth
    {
        get; private set;
    }
    public float HallHeight
    {
        get; private set;
    }

    public int StartRow
    {
        get; private set;
    }
    public int StartCol
    {
        get; private set;
    }

    public int GoalRow
    {
        get; private set;
    }
    public int GoalCol
    {
        get; private set;
    }

    public int OpenRow
    {
        get; private set;
    }
    public int OpenCol
    {
        get; private set;
    }

    void Awake()
    {
        // Instantiate instances of the Maze Mesh and Data generators
        meshGenerator = new MazeMeshGenerator();
        dataGenerator = new MazeDataGenerator();

        // Default to walls surrounding a single empty cell
        Data = new int[,]
        {
            {1, 1, 1},
            {1, 0, 1},
            {1, 1, 1}
        };        
    }

    /**
     * Generates a new maze using the given values, destroying the existing one in the process.
     */
    public void GenerateNewMaze(int sizeRows, int sizeCols,
    TriggerEventHandler startCallback = null, TriggerEventHandler goalCallback = null)
    {
        // Debug message
        if (sizeRows % 2 == 0 && sizeCols % 2 == 0)
        {
            Debug.LogError("Odd numbers work better for dungeon size.");
        }

        // Delete the old maze before creating a new one
        DisposeOldMaze();

        // Generate maze data using the values passed in
        Data = dataGenerator.FromDimensions(sizeRows, sizeCols);

        // Locate a random open space in the maze
        FindOpenSpace();

        // Locate the start and goal positions in the maze
        FindStartPosition();
        FindGoalPosition();        

        // Store values used to generate this mesh
        HallWidth = meshGenerator.width;
        HallHeight = meshGenerator.height;

        // Build the physical representation of the maze
        DisplayMaze();

        // Place the start and goal objects in the maze
        PlaceStartTrigger(startCallback);
        PlaceGoalTrigger(goalCallback);
    }

    /**
     * Instantiates a new game object, and assigns the tag, mesh filter, collider, and renderer.
     */
    private void DisplayMaze()
    {
        // Instatiate a new object, setting the name and tag
        GameObject go = new GameObject();
        go.transform.position = Vector3.zero;
        go.name = "Procedural Maze";
        go.tag = "Generated";

        // Set the mesh filter
        MeshFilter mf = go.AddComponent<MeshFilter>();
        mf.mesh = meshGenerator.FromData(Data);

        // Set the mesh collider
        MeshCollider mc = go.AddComponent<MeshCollider>();
        mc.sharedMesh = mf.mesh;
        mc.material = physicMaterial;

        // Set the mesh renderer
        MeshRenderer mr = go.AddComponent<MeshRenderer>();
        mr.materials = new Material[3] { mazeMat1, mazeMat2, mazeMat3 };
    }

    /**
     * Deletes an existing maze by finding all objects with the tag 'Generated' and destroys them.
     */
    public void DisposeOldMaze()
    {
        // Grab all objects with the tag 'Generated', then destroy them
        GameObject[] objects = GameObject.FindGameObjectsWithTag("Generated");
        foreach (GameObject go in objects)
        {
            Destroy(go);
        }
    }

    /**
     * Finds the first open space in the maze starting from 0,0 and stores the coordinates as the start of the maze.
     */
    private void FindStartPosition()
    {
        // Grab the maze data, including the max position values
        int[,] maze = Data;
        int rMax = maze.GetUpperBound(0);
        int cMax = maze.GetUpperBound(1);

        // Loop top to bottom, right to left
        for (int i = 0; i <= rMax; i++)
        {
            for (int j = 0; j <= cMax; j++)
            {
                // If the current coordinates are 0 (an open space), store them
                if (maze[i, j] == 0)
                {
                    StartRow = i;
                    StartCol = j;
                    return;
                }
            }
        }
    }

    /**
     * Finds the first open space in the maze starting from the max values and stores the coordinates as the goal of the maze.
     */
    private void FindGoalPosition()
    {
        // Grab the maze data, including the max position values
        int[,] maze = Data;
        int rMax = maze.GetUpperBound(0);
        int cMax = maze.GetUpperBound(1);

        // Loop top to bottom, right to left
        for (int i = rMax; i >= 0; i--)
        {
            for (int j = cMax; j >= 0; j--)
            {
                // If the current coordinates are 0 (an open space), store them
                if (maze[i, j] == 0)
                {
                    GoalRow = i;
                    GoalCol = j;
                    return;
                }
            }
        }
    }

    /**
     * Finds a random open space in the maze and stores the coordinates.
     */
    public void FindOpenSpace()
    {
        // Grab the maze data, including the max position values
        int[,] maze = Data;
        int rMax = maze.GetUpperBound(0);
        int cMax = maze.GetUpperBound(1);

        // Set a flag to know when we've found a spot
        bool spotFound = false;

        while (!spotFound)
        {
            // Generate random numbers within the bounds of the maze
            int row = Random.Range(1, rMax);
            int col = Random.Range(1, cMax);

            // If the current coordinates are 0 (an open space), store them
            if (maze[row, col] == 0)
            {
                OpenRow = row;
                OpenCol = col;
                spotFound = true;
            }
        }

        return;
    }

    /**
     * Places the object for the maze's start trigger. Sets a trigger, a callback, and the appropriate material.
     */
    private void PlaceStartTrigger(TriggerEventHandler callback)
    {
        GameObject go = GameObject.CreatePrimitive(PrimitiveType.Cube);
        go.transform.position = new Vector3(StartCol * HallWidth, .5f, StartRow * HallWidth);
        go.name = "Start Trigger";
        go.tag = "Generated";

        go.GetComponent<BoxCollider>().isTrigger = true;
        go.GetComponent<MeshRenderer>().sharedMaterial = startMat;

        TriggerEventRouter tc = go.AddComponent<TriggerEventRouter>();
        tc.callback = callback;
    }

    /**
     * Places the object for the maze's goal trigger. Sets a trigger, a callback, and the appropriate material.
     */
    private void PlaceGoalTrigger(TriggerEventHandler callback)
    {
        GameObject go = GameObject.CreatePrimitive(PrimitiveType.Cube);
        go.transform.position = new Vector3(GoalCol * HallWidth, .5f, GoalRow * HallWidth);
        go.name = "Treasure";
        go.tag = "Generated";

        go.GetComponent<BoxCollider>().isTrigger = true;
        go.GetComponent<MeshRenderer>().sharedMaterial = treasureMat;

        TriggerEventRouter tc = go.AddComponent<TriggerEventRouter>();
        tc.callback = callback;
    }
}
