// Creates a mandelbrot fractal pattern

const int iterations = 64;


float2 c = uv * 3 - float2(2,1.5);


float2 z = c;

for (int i = 0; i < iterations; i++) {
    
    z = float2(
        z.x * z.x - z.y * z.y,
        2 * z.x * z.y
    ) + c;
    if(length(z) > 2) {
        break;
    }
}

float mandelbrot = float(i) / float(iterations);

return mandelbrot;
