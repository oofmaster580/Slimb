if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;
if global.cameraLook return;

spawn_timer--;

if (spawn_timer <= 0)
{
    var cam = view_camera[0];

    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    instance_create_layer(
        random_range(cam_x, cam_x + cam_w),
        random_range(cam_y, cam_y + cam_h),
        "effects",
        windParticle
    );

    spawn_timer = irandom_range(20, 60);
}