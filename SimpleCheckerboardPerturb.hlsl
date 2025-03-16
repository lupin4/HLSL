// Noise Generation Functions
struct noise {

    // Pseudo Random 
    float hash(float2 p) {
        return frac(sin(dot(p, float2(12.9898, 78.233))) * 43758.5453);
    }

    // Simplistic Perlin-like Noise.
    float generate(float2 p) {
        return lerp(lerp(hash(floor(p)), hash(floor(p) + float2(1, 0)), frac(p.x)),
                    lerp(hash(floor(p) + float2(0, 1)), hash(floor(p) + float2(1, 1)), frac(p.x)),
                    frac(p.y));
    }
};
noise noise;

// Checkerboard Scale/Tiling
uv = uv * 6.0;

// Noise Scale
float noiseScale = 8;

// Perturb the UV Coords
float2 warp = uv + noise.generate(uv * noiseScale);

// Check if UV Coord is Even Or Odd To Form Checkerboard Like Pattern.
float result = fmod(floor(warp.x) + 
                    floor(warp.y), 2) == 0.0 ? 1 : 0;

// Output Result As Red
return float3(result, 0, 0);