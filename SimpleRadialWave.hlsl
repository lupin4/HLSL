// UV Center Position
float2 center = float2(0.5, 0.5);

// Calculate Radius
float  radius = length(uv - center);

// Number of Circles/Waves
float  count = 50;

// Apply Sine Wave From Center Outwards
float  wave = abs(sin(radius * count));

// Output Result As Red
return wave * float3(1,0,0);