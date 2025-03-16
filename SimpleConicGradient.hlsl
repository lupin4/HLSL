// UV Center Position
float2 center = float2(0.5, 0.5);

// Direction/Distance From Center 
float2 toCenter = uv - center;

// Calculate Angle In Radians Relative To Center. 
float angle = atan2(toCenter.y, 
                    toCenter.x) + 3.14;

// Output Result As Red.
return float3(angle / (1.0 * 3.14), 0.0, 0.0);