if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;
if global.cameraLook return;

var prev_y = y;

// Fly
x += move_speed * dir;

// Bob up and down
bob += 0.08;
y = start_y + sin(bob) * 2;

// Set sprite frame
if (y > prev_y)
{
    image_index = 1; // Falling
}
else
{
    image_index = 0; // Rising
}

// Destroy when off-screen
var cam = view_camera[0];

var cam_x = camera_get_view_x(cam);
var cam_w = camera_get_view_width(cam);

if (x < cam_x - sprite_width * 2 ||
    x > cam_x + cam_w + sprite_width * 2)
{
    instance_destroy();
}