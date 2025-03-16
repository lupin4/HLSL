// UV Center Position
float2 center = float2(0.5, 0.5);

// Direction/Distance From Center 
float2 toCenter = uv - center;

// Calculate the gradient to form a V shape
float grad = 1.0 - abs(toCenter.x - 
                       toCenter.y);

// Normalize
grad = saturate(grad);

// Output Result As Red.
return float3(grad, 0, 0);
