// Remap UV Coords to -1 to 1 instead of 0 to 1. 
uv = uv * 2 - 1; 

// Calculate Y Coordinate of Sine Wave.
float wave = 0.5 * sin(6.0 * uv.x);

// Color Sine Wave as Red
float3 result = (abs(uv.y - wave) <= 0.1) 
                ? float3(1, 0, 0) 
                : float3(0, 0, 0);

return result;