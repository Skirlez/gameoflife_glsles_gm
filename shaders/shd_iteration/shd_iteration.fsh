//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float res_x;
uniform float res_y;


int get_pixel_life(vec2 dir) {
	return int(texture2D(gm_BaseTexture, v_vTexcoord + dir).r);
}

int get_neighbors() {
	float pixel_x = 1.0 / res_x;
	float pixel_y = 1.0 / res_y;
	int neighbors = 0;
	neighbors += get_pixel_life(vec2(pixel_x, 0));
	neighbors += get_pixel_life(vec2(pixel_x, pixel_y));
	neighbors += get_pixel_life(vec2(0, pixel_y));
	neighbors += get_pixel_life(vec2(-pixel_x, pixel_y));
	neighbors += get_pixel_life(vec2(-pixel_x, 0));
	neighbors += get_pixel_life(vec2(-pixel_x, -pixel_y));
	neighbors += get_pixel_life(vec2(0, -pixel_y));
	neighbors += get_pixel_life(vec2(pixel_x, -pixel_y));
	return neighbors;
}

void main()
{
	int num = get_neighbors();
	bool alive = bool(texture2D(gm_BaseTexture, v_vTexcoord).r);
	
	if (alive) {
		if (num == 3 || num == 2)
			gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
		else
			gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
	}
	else {
		if (num == 3)
			gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
		else
			gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
	}
}
