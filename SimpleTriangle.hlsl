// Remap UV Coords to -1 to 1 instead of 0 to 1. 
uv = uv * 2 - 1; 

// Variable to store our result.
float3 result = float3(0, 0, 0); 

// Area of Triangle using UV Coords
float triangleArea = min( uv.x + uv.y, 
                     min(-uv.x + uv.y, uv.y - abs(uv.x)));

// Is Within Triangle Area
if (triangleArea >= 0) 
{
    result = float3(1, 0, 0);
} 
else 
{
    result = float3(0, 0, 0);
}

// Output Result
return result;