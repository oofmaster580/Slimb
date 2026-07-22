// dynamically get width and height of menu
var _new_w = 0;

var currentLength = array_length(option[menu_level]);

for (var i = 0; i < currentLength; i++)
{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}

width = _new_w + op_border*2
height = op_border * 2 + string_height(option[0, 0]) + (op_length-1)*op_space

// center menu 
x = (room_width / 2) - width / 2
y = (room_height / 2) - height / 2

// draw menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1)

draw_set_font(PixelFont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)

draw_set_color(make_color_rgb(0, 0, 0))

if menu_level == 0
{
	draw_text_ext_transformed(room_width / 2, 16, "WASD to navigate", 16, 280, 0.75, 0.75, 0)
	draw_text_ext_transformed(room_width / 2, 32, "J to select", 16, 280, 0.75, 0.75, 0)
}
if menu_level == 1
{
	draw_text_ext_transformed(room_width / 2, 16, "Warning: you may have ghost tapping!", 16, 280, 0.75, 0.75, 0)
	draw_text_ext_transformed(room_width / 2, 32, "If something feels off, change it with the controls settings", 16, 10000, 0.75, 0.75, 0)
}


// draw the options
draw_set_font(PixelFont)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

for(var i = 0; i < op_length; i++)
{
	var _c = make_color_rgb(30, 96, 110)
	if pos == i {_c = make_color_rgb(45, 27, 0)}
	draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1)
}