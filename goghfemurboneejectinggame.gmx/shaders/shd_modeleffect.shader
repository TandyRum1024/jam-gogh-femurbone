// wacky distort effect
#define M_PI 3.14
#define M_2PI (M_PI * 2.0)

attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uTime;
uniform float uDistortIntensity;
uniform float uDistortFrequency;
uniform float uTintIntensity;

// From https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83
float mod289(float x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
vec4 mod289(vec4 x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
vec4 perm(vec4 x){return mod289(((x * 34.0) + 1.0) * x);}

float noise(vec3 p){
    vec3 a = floor(p);
    vec3 d = p - a;
    d = d * d * (3.0 - 2.0 * d);

    vec4 b = a.xxyy + vec4(0.0, 1.0, 0.0, 1.0);
    vec4 k1 = perm(b.xyxy);
    vec4 k2 = perm(k1.xyxy + b.zzww);

    vec4 c = k2 + a.zzzz;
    vec4 k3 = perm(c);
    vec4 k4 = perm(c + 1.0);

    vec4 o1 = fract(k3 * (1.0 / 41.0));
    vec4 o2 = fract(k4 * (1.0 / 41.0));

    vec4 o3 = o2 * d.z + o1 * (1.0 - d.z);
    vec2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);

    return o4.y * d.y + o4.x * (1.0 - d.y);
}

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    // Add random distortion to vertex position
    float posnoise = noise(object_space_pos.xyz * uDistortFrequency);
    object_space_pos.xyz += vec3(sin(uTime * M_2PI + posnoise * M_PI), cos(uTime * M_2PI + posnoise * M_PI), sin(uTime * M_2PI + posnoise * M_PI)) * uDistortIntensity;
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    // Apply ps1-like degrading to vertex data
    const float degradeprecisiondata = 128.0;
    const float degradeprecisionmodel = 64.0;
    v_vTexcoord = floor(v_vTexcoord * degradeprecisiondata) / degradeprecisiondata;
    v_vColour = floor(v_vColour * degradeprecisiondata) / degradeprecisiondata;
    gl_Position.xyz = floor(gl_Position.xyz * degradeprecisionmodel) / degradeprecisionmodel;
    
    // Add random tint to vertices
    v_vColour.rgb *= mix(vec3(1.0), vec3(posnoise, 1.0 - posnoise, mod(posnoise * 42.0, 2.0)), uTintIntensity);
    
    // Add tint according to distance from center
    v_vColour.rgb *= (1.0 - clamp(length(gl_Position.xyz) / 64.0, 0.0, 1.0) * 0.2);
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// wacky distort effect
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

