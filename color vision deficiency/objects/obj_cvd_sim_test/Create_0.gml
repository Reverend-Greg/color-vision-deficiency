/// @description 

shader				= shd_cvd_sim;
u_filter_type		= shader_get_uniform(shader, "type");
u_filter_strength	= shader_get_uniform(shader, "strength");
filter_type			= 0;
filter_strength		= 1;
filter_text			= "normal";
filter_text_w		= string_width(filter_text);
filter_text_h		= string_height(filter_text);


info_text = 
"1: Protanopia (0.59%)"		+ "\n" +
"2: Protanomaly (0.66%)"	+ "\n" +
"3: Deuteranopia (0.56%)"	+ "\n" +
"4: Deuteranomaly (2.7%)"	+ "\n" +
"5: Tritanopia (0.015%)"	+ "\n" +
"6: Tritanomaly (0.01%)"	+ "\n" +
"7: Achromatopsia (0.001%)"	+ "\n" +
"8: Achromatomaly (0.001%)"  + "\n\n" +
"ESC: exit"+ "\n" +
"mouse x: strength";

info_text_w		= string_width(info_text);
info_text_h		= string_height(info_text);




