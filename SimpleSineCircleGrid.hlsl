float f = 22;   // Frequency
float a = 0.1; // Amplitude

float result = frac(sin(uv.x * f) + 
                    sin(uv.y * f)) * a;

return float3(result, 0, 0);