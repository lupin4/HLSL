// creates a flower pattern

// Shifts the 0,0,0 origin of the UV space to the center of the texture
uv = uv * 2 - 1;


float3 result = float3(0, 0, 0);
float distance = length(uv);

float size = 0.5;
float petals = 5;
float thickness = 0.5;
float inset = 0.7;


if(distance <= thickness * (size + inset * sin(petals * atan2(uv.y, uv.x)))) {
    result = float3(1, 1, 1);
}
return result;
