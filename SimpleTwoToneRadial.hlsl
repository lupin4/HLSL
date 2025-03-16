// UV Center Position
float2 center = float2(0.5, 0.5);

// Direction/Distance From Center
float2 toCenter = uv - center;

// Radial Gradient Pattern.
float grad = abs(sin(length(toCenter) * 10.0));

// Lerp/Mix with Two Colors (Red / Green)
return lerp(float3(1, 0, 0), 
            float3(0, 1, 0), grad);