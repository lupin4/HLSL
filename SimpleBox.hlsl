// Remap UV Coords to -1 to 1 instead of 0 to 1. 
uv = uv * 2 - 1; 

// Variable to store our result.
float3 result = float3(0, 0, 0); 

// Box Dimensions
float width = 0.5;
float height = 0.5;

// Check if UV is within the box. 
if (abs(uv.x) <= width && 
    abs(uv.y) <= height) 
{
    result = float3(1, 0, 0); // If so, return Red.
}

// Output Result
return result;