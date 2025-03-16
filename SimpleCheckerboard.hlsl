// Checkerboard Scale/Tiling
uv = uv * 6.0;

// Variable to store our result.
float3 result = float3(0, 0, 0); 

// Check if UV Coord is Even Or Odd.
if (fmod(floor(uv.x) + 
         floor(uv.y), 2) == 0.0) 
{
    // If Even, set Color to Red.
    result = float3(1, 0, 0); 
}

// Output Result
return result;