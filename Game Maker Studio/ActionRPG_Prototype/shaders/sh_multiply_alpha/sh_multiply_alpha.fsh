//
// Simple passthrough fragment shader wih alpha multiplication
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float alpha;

void main()
{
    vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    col.a *= alpha;
    gl_FragColor = col;
}