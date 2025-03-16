// Variable to store our result.
float3 result = float3(0, 0, 0); 

float dotSize = 0.03;  // Size of Dots
float lineSpace = 0.1; // Spacing of Lines

// Position of each Dot in Grid.
float2 offset = fmod(uv + 1, lineSpace) - 
                             lineSpace * 0.5;

// Check if Position Is Within Dot Shape or Line Shape
if (length(float2(offset.x, 
                  offset.y)) <= dotSize) 
{
    result = float3(0, 1, 0); // Color Dot Green
} 
else if (abs(offset.x) <= dotSize * 0.3 || 
         abs(offset.y) <= dotSize * 0.3) 
{
    result = float3(1, 0, 0); // Color Line Red
}

// Output Result
return result;