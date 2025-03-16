// Get Min/Max Bounds Of Our PCG Volume.
float boundsMin = GetComponentBoundsMin();
float boundsMax = GetComponentBoundsMax();

// Create A Grid Of Points Across The Terrain Based On The Min & Max Bounds.
float3 pointLocation = CreateGrid2D(ElementIndex, NumPoints, boundsMin, boundsMax);

// Get The Height Of Our pointLocation.
float height = In_GetHeight(pointLocation);

// Define The Filter Size For Sampling Offset in X/Y.
static const float2 filterSize = float2(1, 1);

// Define Offsets For Surrounding Points In Each Direction.
float3 offsets[4] = {
    float3(-filterSize.x, 0.0, 0.0), // Left
    float3( filterSize.x, 0.0, 0.0), // Right
    float3(0.0,-filterSize.y, 0.0),  // Down
    float3(0.0, filterSize.y, 0.0)   // Up
};

// Sample Height At Each Offset/Neighbouring Location.
float heights[4];

for (int i = 0; i < 4; i++) {
    heights[i] = In_GetHeight(pointLocation + offsets[i]);
}

// Average Height Of Neightbouring Points.
float avgHeight = 0.25 * (heights[0] + heights[1] + heights[2] + heights[3]);

// Difference Between Avg Height And Sampled Heights, Clamped To 0-1 Range.
float difHeight[4];
for (int i = 0; i < 4; i++) {
    difHeight[i] = saturate(avgHeight - heights[i]);
}

// Difference Of Avg Height And Original Height.
float mask = saturate(avgHeight - height);

// Smooth Mask By Adding Surrounding Differences & Average The Result.
float smoothmask = (mask + difHeight[0] + difHeight[1] + difHeight[2] + difHeight[3]) * 0.2;

// Produces A Value Between 0.5 & 50 Based On smoothmask, If smoothmask Is > 0.005.
// We Saturate smoothmask so it clamps between 0-1. 
float scale = (smoothmask > 0.005) ? lerp(0.1, 8.0, saturate(smoothmask)) : 0.0;

// Make Sure pointLocation.z Is At The Sampled Height Of The Terrain.
pointLocation.z = height;

// Output Point Position, And Set The Point Scale Based On Our Resulting Scale Values From Our smoothmask.
Out_SetPosition(Out_DataIndex, ElementIndex, pointLocation);
Out_SetScale(Out_DataIndex, ElementIndex, scale);