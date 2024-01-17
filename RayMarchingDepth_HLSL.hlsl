float3 rayStep = viewDir * -1;
float4 inputTex = Texture2DSample(texObject, texObjectSampler, uv);

for(int i = 0; i < 25; i++)
{
    if(inputTex.r > 0.1 && inputTex.g > 0.1 && inputTex.b > 0.1)
    {
        return float3(i,0,0);
    }

    uv += rayStep * 0.15;

    inputTex = Texture2DSample(texObject, texObjectSampler, uv.xy);
}

return inputTex;