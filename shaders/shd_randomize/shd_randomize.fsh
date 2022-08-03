//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float rand;

float hash(vec2 p)
{
	// thanks xor
    p = mod(p, 31.533);
    return fract(sin(p.x*1312.9898 + p.y*7328.233) * rand);
}

void main()
{
	float colrand = hash(v_vTexcoord);
	if (colrand <= 0.5)
		gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	else
		gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
}
