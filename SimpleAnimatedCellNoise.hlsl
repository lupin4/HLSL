#define POINTS 64 // Number of Random Points For Cell Noise Generation.

struct noise
{
    // Distance Between Two Points.
    float dist(float2 p1, float2 p2) 
    {
        return dot(p1 - p2, p1 - p2);
    }

    // Generate Pseudo Random Values.
    float rand(float2 uv) 
    {
        return frac(sin(dot(uv, float2(12.345, 67.890))) * 9876.5432);
    }

    // Cell Noise Like Pattern Function.
    float cell(float2 uv, int ptnum) 
    {
        
        // Minimum Distance to Nearest Random Point.
        float minCell = 1.0; 

        // Specify our number of POINTS.
        float2 randPoint[POINTS];

        // Assign each randPoint a Pseudo Random Value for Position of Point.
        for (int i = 0; i < POINTS; i++) 
        {
            randPoint[i] = float2(rand(float2(float(i), 0.0)), 
                                  rand(float2(float(i), 1.0)));
        }

        // Iterate through a number of points to calculate the Cell Noise like pattern.
        for (int j = 0; j < ptnum; j++) 
        {
            // Distance to current random point from uv.
            float d = dist(uv, randPoint[j]);

            // Update minCell distance if the current distance is smaller.
            minCell = min(minCell, d);
        }

        // Normalize distance.
        minCell = 1.0 - minCell;

        // Saturate to clamp range to modify contrast.
        minCell = saturate(minCell * 1.0); 

        return minCell;
    }
};
noise cellNoise;

// Time to animate cells, multiplied by a value to increase number of cells.
float cellAnim = sin(time) * 20; 

// Calculate cell noise like pattern with cellAnim.
float noiseValue = cellNoise.cell(uv, int(cellAnim)); 

// Output Cell Noise like pattern with red and blue coloring.
return float3(1 - noiseValue, 0, noiseValue * 0.5); 