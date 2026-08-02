// Keep it in the camera corner
var cam = view_camera[0];

x = camera_get_view_x(cam) + 20;
y = camera_get_view_y(cam) + camera_get_view_height(cam) - sprite_height - 10;

image_alpha = sprite_alpha