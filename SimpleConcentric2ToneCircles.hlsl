// UV Tiling
uv = frac(uv * 10);

// Circle Radius
float circleRadius = 0.3;

// Alternating Concentric Circles 
bool pattern = (int(floor(length(uv - 0.5) / circleRadius)) % 2) == 0;

// Output Color (Red and Green)
return pattern ? float3(1, 0, 0): 
                 float3(0, 1, 0);
