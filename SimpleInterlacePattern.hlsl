// UV Center Position
float2 center = float2(0.5, 0.5);

// Direction/Distance From Center
float2 toCenter = uv - center;

// Is UV Even or Odd?
bool even = ((floor(uv.x * 10.0) + 
              floor(uv.y * 10.0)) % 2) == 0;

// Checker Pattern with Horiztonal Lines on Even and Vertical on Odd.
float pattern = 0;

// Line Thickness
float hThick = 0.25;
float vThick = 0.25;

if (even)
{
    pattern = step(hThick, abs(frac(uv.y * 10.0) - 0.5)); // Horizontal
}
else
{
    pattern = step(vThick, abs(frac(uv.x * 10.0) - 0.5)); // Vertical
}

// Make Lines Red, Background As 0, 0, 0.
return lerp(float3(1, 0, 0),
            float3(0, 0, 0), pattern);
