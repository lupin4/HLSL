// Remap UV Coords to -1 to 1 instead of 0 to 1. 
uv = uv * 2 - 1; 

// Variable to store our result.
float3 result = float3(0, 0, 0); 

// Calculate distance of UV Point from the Center of UV.
float dist = length(uv);

// Flower Shape Parameters
float size = 1;             // Size
float petals = 6;           // Petal Count
float thickness = 0.3;      // Petal Thickness
float inset = 0.5;          // Petal Inset

// Flower Shape Based On Parameters
if (dist <= thickness * (size + inset * sin(petals * atan2(uv.y, uv.x)))) 
{
    result = float3(1, 0, 0); // If so, return Red.
}

return result;