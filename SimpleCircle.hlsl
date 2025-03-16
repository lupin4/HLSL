// Position of Circle 0.5 for both x/y.
float2 pos = 0.5;

// Distance between two points circle Positon and UV.
float d = length(pos-uv);

// Return values within Radius of Circle as Red.
return float3(d <= 0.5, 0, 0);