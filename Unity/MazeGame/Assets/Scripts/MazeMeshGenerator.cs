using System.Collections.Generic;
using UnityEngine;

public class MazeMeshGenerator
{
    // Generator params -- how wide and tall are the hallways
    public float width;
    public float height;

    /**
     * Default constructor.
     */
    public MazeMeshGenerator()
    {
        // Set the width and height values for the hallways
        width = 3.75f;
        height = 4.5f;
    }

    /**
     * Generates a mesh for the maze using the data generated in the generation algorithm.
     */
    public Mesh FromData(int[,] data)
    {
        // Initialize a new mesh
        Mesh maze = new Mesh();

        // Initialize lists for the vertices and UVs
        List<Vector3> newVertices = new List<Vector3>();
        List<Vector2> newUVs = new List<Vector2>();

        // Initialize lists for the triangles used for the floors, walls, and ceiling
        maze.subMeshCount = 3;
        List<int> floorTriangles = new List<int>();
        List<int> wallTriangles = new List<int>();
        List<int> ceilingTriangles = new List<int>();

        int rMax = data.GetUpperBound(0);
        int cMax = data.GetUpperBound(1);
        float halfH = height * .5f;

        // Iterate through the maze data, building quads for the floor, ceiling, and walls for every cell
        for (int i = 0; i <= rMax; i++)
        {
            for (int j = 0; j <= cMax; j++)
            {
                if (data[i, j] != 1)
                {
                    // Add the floor to the current cell
                    AddQuad(Matrix4x4.TRS(
                        new Vector3(j * width, 0, i * width),
                        Quaternion.LookRotation(Vector3.up),
                        new Vector3(width, width, 1)
                    ), ref newVertices, ref newUVs, ref floorTriangles);

                    // Add the ceiling to the current cell
                    AddQuad(Matrix4x4.TRS(
                        new Vector3(j * width, height, i * width),
                        Quaternion.LookRotation(Vector3.down),
                        new Vector3(width, width, 1)
                    ), ref newVertices, ref newUVs, ref ceilingTriangles);


                    // Add walls on sides next to blocked grid cells
                    if (i - 1 < 0 || data[i - 1, j] == 1) // Straight ahead
                    {
                        AddQuad(Matrix4x4.TRS(
                            new Vector3(j * width, halfH, (i - .5f) * width),
                            Quaternion.LookRotation(Vector3.forward),
                            new Vector3(width, height, 1)
                        ), ref newVertices, ref newUVs, ref wallTriangles);
                    }

                    if (j + 1 > cMax || data[i, j + 1] == 1) // Left
                    {
                        AddQuad(Matrix4x4.TRS(
                            new Vector3((j + .5f) * width, halfH, i * width),
                            Quaternion.LookRotation(Vector3.left),
                            new Vector3(width, height, 1)
                        ), ref newVertices, ref newUVs, ref wallTriangles);
                    }

                    if (j - 1 < 0 || data[i, j - 1] == 1) // Right
                    {
                        AddQuad(Matrix4x4.TRS(
                            new Vector3((j - .5f) * width, halfH, i * width),
                            Quaternion.LookRotation(Vector3.right),
                            new Vector3(width, height, 1)
                        ), ref newVertices, ref newUVs, ref wallTriangles);
                    }

                    if (i + 1 > rMax || data[i + 1, j] == 1) // Behind
                    {
                        AddQuad(Matrix4x4.TRS(
                            new Vector3(j * width, halfH, (i + .5f) * width),
                            Quaternion.LookRotation(Vector3.back),
                            new Vector3(width, height, 1)
                        ), ref newVertices, ref newUVs, ref wallTriangles);
                    }
                }
            }
        }

        // Convert the vertices and UV values to arrays
        maze.vertices = newVertices.ToArray();
        maze.uv = newUVs.ToArray();

        // Convert the floor, ceiling, and wall triangles to arrays and assign them in the mesh
        maze.SetTriangles(floorTriangles.ToArray(), 0);
        maze.SetTriangles(wallTriangles.ToArray(), 1);
        maze.SetTriangles(ceilingTriangles.ToArray(), 2);

        // Prepare the mesh for lighting
        maze.RecalculateNormals();

        // Return the generated mesh data
        return maze;
    }

    /**
     * Generates a quad using the given parameters.
     */
    private void AddQuad(Matrix4x4 matrix, ref List<Vector3> newVertices,
        ref List<Vector2> newUVs, ref List<int> newTriangles)
    {
        // Determine which index to start from
        int index = newVertices.Count;

        // Corners before transforming
        Vector3 vert1 = new Vector3(-0.5f, -0.5f, 0);
        Vector3 vert2 = new Vector3(-0.5f, 0.5f, 0);
        Vector3 vert3 = new Vector3(0.5f, 0.5f, 0);
        Vector3 vert4 = new Vector3(0.5f, -0.5f, 0);

        // Add the vertices for this quad
        newVertices.Add(matrix.MultiplyPoint3x4(vert1));
        newVertices.Add(matrix.MultiplyPoint3x4(vert2));
        newVertices.Add(matrix.MultiplyPoint3x4(vert3));
        newVertices.Add(matrix.MultiplyPoint3x4(vert4));

        // Add the UVs for this quad
        newUVs.Add(new Vector2(1, 0));
        newUVs.Add(new Vector2(1, 1));
        newUVs.Add(new Vector2(0, 1));
        newUVs.Add(new Vector2(0, 0));

        // Add the triangles for this quad
        newTriangles.Add(index + 2);
        newTriangles.Add(index + 1);
        newTriangles.Add(index);
        newTriangles.Add(index + 3);
        newTriangles.Add(index + 2);
        newTriangles.Add(index);
    }

}
