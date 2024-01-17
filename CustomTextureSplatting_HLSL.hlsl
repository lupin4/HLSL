float4 result = float4(0, 0, 0, 0);

float splats = 3;

float2 seed = float2(123.456, 789.012); 

float2 scaleRange = float2(1,3);
float2 rotationRange = float2(0,360);


for (int i = 0; i < splats; i++)
{
    seed = frac(seed * 123.456);

    float randScale = lerp(scaleRange.x, scaleRange.y, seed.x);
    float randRotation = radians(lerp(rotationRange.x, rotationRange.y, seed.y));

    float2x2 rotationMatrix = float2x2(cos(randRotation), -sin(randRotation),
                                       sin(randRotation), cos(randRotation));

    float2 uvResult = mul(rotationMatrix, uv * randScale);

    float4 sampledColor = Texture2DSample(inputTex, inputTexSampler, uvResult);

    result += sampledColor;
}

result  = pow(result, contrast);
result /= splats;
return result;