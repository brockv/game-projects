//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vScreenPos;

uniform vec3 playerPosition; // x = player's x-position, y = player's y-position, z = radius

void main()
{
	// Coordinate calculations
	vec2 vect = vec2( v_vScreenPos.x - playerPosition.x, v_vScreenPos.y - playerPosition.y );
	float dist = sqrt(vect.x * vect.x + vect.y * vect.y);
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

	// Check if the current pixel is out of range, and change its alpha accordingly
	if ((dist > playerPosition.z) && (gl_FragColor.a > 0.0)) {
		float falloff = dist / playerPosition.z; // Determine the fall off distance
		gl_FragColor.a = mix(0.8, 0.3, falloff); // Set the alpha value
	} //else {
	//	float falloff = dist * playerPosition.z; // Determine the fall off distance
	//	gl_FragColor.a = mix(0.8, 0.3, falloff); // Set the alpha value
	//}
}
