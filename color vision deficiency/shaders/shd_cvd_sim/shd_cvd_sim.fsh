//
// Shader to simulate different forms of color vision deficiency (cvd)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float type;     // see the list below
uniform float strength;	// 0-1

/* Links:
https://web.archive.org/web/20081014161121/http://www.colorjack.com/labs/colormatrix/
https://www.alanzucconi.com/2015/12/16/color-blindness/
https://barrierefreies.design/barrierefreiheit-interaktiv-testen/farbenfehlsichtigkeit-simulieren
*/

/* Types:
1: Protanopia		(0.59%)	
2: Protanomaly		(0.66%)
3: Deuteranopia		(0.56%)
4: Deuteranomaly	(2.7%)
5: Tritanopia		(0.015%)
6: Tritanomaly		(0.01%)
7: Achromatopsia	(<0.001%)
8: Achromatomaly	(<0.001%)
*/

vec3 protanopia(vec3 col) {
	//R:[56.667, 43.333, 0], G:[55.833, 44.167, 0], B:[0, 24.167, 75.833]
	return vec3(	0.56667 * col.r + 0.43333 * col.g,
					0.55833 * col.r	+ 0.44167 * col.g,
					0.24167 * col.g	+ 0.75833 * col.b);
}

vec3 protanomaly(vec3 col) {
	//R:[81.667, 18.333, 0], G:[33.333, 66.667, 0], B:[0, 12.5, 87.5]
	return vec3(	0.81667 * col.r + 0.18333 * col.g,
					0.33333 * col.r	+ 0.66667 * col.g,
					0.12500 * col.g	+ 0.87500 * col.b);
}

vec3 deuteranopia(vec3 col) {
	//R:[62.5, 37.5, 0], G:[70, 30, 0], B:[0, 30, 70]
	return vec3(	0.625 * col.r + 0.375 * col.g,
					0.700 * col.r + 0.300 * col.g,
					0.300 * col.g + 0.700 * col.b);
}

vec3 deuteranomaly(vec3 col) {
	//R:[80, 20, 0], G:[25.833, 74.167, 0], B:[0, 14.167, 85.833]
	return vec3(	0.80000 * col.r + 0.20000 * col.g,
					0.25833 * col.r	+ 0.74167 * col.g,
					0.14167 * col.g	+ 0.85833 * col.b);
}

vec3 tritanopia(vec3 col) {
	//R:[95, 5, 0], G:[0, 43.333, 56.667], B:[0, 47.5, 52.5]
	return vec3(	0.95000 * col.r + 0.05000 * col.g,
					0.43333 * col.g	+ 0.56667 * col.b,
					0.47500 * col.g	+ 0.52500 * col.b);
}

vec3 tritanomaly(vec3 col) {
	//R:[96.667, 3.333, 0], G:[0, 73.333, 26.667], B:[0, 18.333, 81.667]
	return vec3(	0.96667 * col.r + 0.03333 * col.g,
					0.73333 * col.g	+ 0.26667 * col.b,
					0.18333 * col.g	+ 0.81667 * col.b);
}

vec3 achromatopsia(vec3 col) {
	//R:[29.9, 58.7, 11.4], G:[29.9, 58.7, 11.4], B:[29.9, 58.7, 11.4]
	return vec3(	0.299 * col.r + 0.587 * col.g + 0.114 * col.g);
}

vec3 achromatomaly(vec3 col) {
	//R:[61.8, 32, 6.2], G:[16.3, 77.5, 6.2], B:[16.3, 32.0, 51.6]
	return vec3(	0.618 * col.r + 0.320 * col.g + 0.062 * col.b,
					0.163 * col.r + 0.775 * col.g + 0.062 * col.b,
					0.163 * col.r + 0.320 * col.g + 0.516 * col.b);
}


void main() {
    vec4 base_col	= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 sim_col	= base_col.rgb;
	
	if      (type == 1.0) {sim_col = protanopia(base_col.rgb);}
	else if (type == 2.0) {sim_col = protanomaly(base_col.rgb);}
	else if (type == 3.0) {sim_col = deuteranopia(base_col.rgb);}
	else if (type == 4.0) {sim_col = deuteranomaly(base_col.rgb);}
	else if (type == 5.0) {sim_col = tritanopia(base_col.rgb);}
	else if (type == 6.0) {sim_col = tritanomaly(base_col.rgb);}
	else if (type == 7.0) {sim_col = achromatopsia(base_col.rgb);}
	else if (type == 8.0) {sim_col = achromatomaly(base_col.rgb);}
	
	vec3 out_col	= mix(base_col.rgb, sim_col, strength);
	gl_FragColor = vec4(out_col, base_col.a);
}
