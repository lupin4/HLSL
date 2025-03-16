// UV Center Position
float2 center = float2(0.5, 0.5);

// Direction/Distance From Center 
float2 toCenter = uv - center;

// Gradient From Min of X/Y 
float grad = min(abs(toCenter.x), 
                 abs(toCenter.y));

// Normalize.
grad = saturate(grad);

// Output Result As Red.
return float3(grad, 0, 0);