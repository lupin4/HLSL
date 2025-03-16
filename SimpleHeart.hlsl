// Remap UV Coords to -1 to 1 instead of 0 to 1. 
uv = uv * 2 - 1; 

// Variable to store our result.
float3 result = float3(0, 0, 0); 

// Heart Shape Parameters
float size  = 0.5;  // Size
float shift = 0.5; // Vertical Shift Of Center

// Calculate distance from center of Heart Shape.
float2 dist = float2(uv.x, 
                    -uv.y - shift * sqrt(abs(uv.x)));

// Define a Heart Shape Condition.
if (dist.x * dist.x + dist.y * dist.y <= size) 
{
    result = float3(1, 0, 0); // If so, return Red.
}

return result;