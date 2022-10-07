/// @description input
filter_strength = mouse_x / room_width;

var old_filter_type = filter_type;
if keyboard_check_pressed(ord("1")) {
	filter_type = 1;
	filter_text = "Protanopia";
}
if keyboard_check_pressed(ord("2")) {
	filter_type = 2;
	filter_text = "Protanomaly";
}
if keyboard_check_pressed(ord("3")) {
	filter_type = 3;
	filter_text = "Deuteranopia";
}
if keyboard_check_pressed(ord("4")) {
	filter_type = 4;
	filter_text = "Deuteranomaly";
}
if keyboard_check_pressed(ord("5")) {
	filter_type = 5;
	filter_text = "Tritanopia";
}
if keyboard_check_pressed(ord("6")) {
	filter_type = 6;
	filter_text = "Tritanomaly";
}
if keyboard_check_pressed(ord("7")) {
	filter_type = 7;
	filter_text = "Achromatopsia";
}
if keyboard_check_pressed(ord("8")) {
	filter_type = 8;
	filter_text = "Achromatomaly";
}

if (filter_type != old_filter_type) {
	filter_text_w = string_width(filter_text);
}

if keyboard_check_pressed(vk_escape) {
	game_end();
}