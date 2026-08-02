var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

x = base_x + cam_x * parallax;
y = base_y + cam_y * parallax; // optional for platformers