// UV Center Position.
float2 center = float2(0.5, 0.5);

// Direction/Distance From Center.
float2 toCenter = uv - center;

// Diamond Gradient By Sum of Values.
float diamond = abs(toCenter.x) + 
                abs(toCenter.y);

// Normalize.
diamond = saturate(diamond);

// Output Result As Red.
return float3(diamond, 0, 0);