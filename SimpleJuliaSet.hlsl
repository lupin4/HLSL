// Maximum Calculation/Iterations
const int iter = 64;

// Julia Set UV Position
float2 c = uv * 3 - float2(1.5, 1.5);

// Starting Position 
float2 z = c;

// Loop To Draw The Julia Set
for (int i = 0; i < iter; i++) 
{
    // Update using Julia Set formula.
    z = float2(z.x * z.x - z.y * z.y, 2 * z.x * z.y) + float2(-0.7, 0.270);

    // Check if distance from center exceeds a value.
    if (length(z) > 2.0) 
    {
        // Stop exploration to save time.
        break;
    }
}

// Calculate Julia Set Value on number of Iterations
float juliaset = float(i) / float(iter);

// Output Result
return float3(juliaset, 0, 0); // Return Red.