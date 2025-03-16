// UV Tiling
uv = frac(uv * 10);

// Line Thickness
float thickness = 0.1; 

// Check if UV Point is inside Shape
bool pattern = (abs(uv.x + uv.y) <= thickness) || 
               (abs(uv.x - uv.y) <= thickness);

// Output As Red, or Black If Not Inside The Pattern
return pattern ? float3(1, 0, 0): 
                 float3(0, 0, 0);