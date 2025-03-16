// Maximum Calculation/Iterations
const int iter = 64;

// Mandelbrot UV Position
float2 c = uv * 3 - float2(2, 1.5);

// Starting Position 
float2 z = c;

// Declare iteration counter outside the loop
int i = 0;

// Loop To Draw The Mandelbrot
for (; i < iter; i++) 
{
    // Update using Mandelbrot formula.
    z = float2(z.x * z.x - z.y * z.y, 2 * z.x * z.y) + c;

    // Check if distance from center exceeds a value.
    if (length(z) > 2) 
    {
        // Stop exploration to save time.
        break;
    }
}

// Calculate Mandelbrot Value on number of Iterations
float mandelbrot = float(i) / float(iter);

// Output Result
return float3(mandelbrot, 0, 0); // Return Red.
