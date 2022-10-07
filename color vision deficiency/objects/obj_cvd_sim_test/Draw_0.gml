/// @description self filtered

shader_set(shader); 
	shader_set_uniform_f(u_filter_type, filter_type);	
	shader_set_uniform_f(u_filter_strength, filter_strength);
	draw_self();
shader_reset();

draw_set_color(c_black);
draw_rectangle(x + 5, y + 5, x + filter_text_w + 15, y + filter_text_h + 15, false);
draw_set_color(c_white);
draw_text(x + 10, y + 10, filter_text);

draw_set_color(c_black);
draw_rectangle(5, 5, info_text_w + 15, info_text_h + 15, false);
draw_set_color(c_white);
draw_text(10, 10, info_text);

