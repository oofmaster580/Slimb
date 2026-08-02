if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;

var cam = view_camera[0];


instance_create_layer(camera_get_view_x(cam) + camera_get_view_width(cam), random_range(camera_get_view_y(cam), camera_get_view_y(cam) + camera_get_view_height(cam)),
    "cloudObj",
    cloudObj
);

alarm[0] = irandom_range(100, 300);