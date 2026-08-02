if room != TitleRoom && room != jumboRoom
{
draw_set_font(PixelFont)

draw_set_halign(fa_middle);
draw_set_valign(fa_top);

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

draw_text_transformed(
	cam_x + camera_get_view_width(view_camera[0]) / 2,
	cam_y + 8,
	global.points,
	0.5,
	0.5,
	0
)
}

if room == TitleRoom
{
draw_set_font(PixelFont)

draw_set_halign(fa_middle);
draw_set_valign(fa_top);

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

draw_text_transformed(
	cam_x + camera_get_view_width(view_camera[0]) / 2,
	cam_y + 8,
	global.mostPoints,
	0.5,
	0.5,
	0
)
}