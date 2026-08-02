image_xscale = random_range(0.4, 0.7)
image_yscale = image_xscale

image_speed = 0

// Pick a direction
dir = choose(-1, 1);

var cam = view_camera[0];

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Spawn just off-screen
if (dir == 1)
    x = cam_x - sprite_width;
else
    x = cam_x + cam_w + sprite_width;

// Random height
y = random_range(cam_y + 16, cam_y + cam_h * 0.4);

// Movement
move_speed = random_range(0.7, 0.9) * image_xscale;
image_xscale = dir;

start_y = y;
bob = random(360);


switch (room)
{
	case Room1:
	case Room1_1:
	case TitleRoom: sprite_index = birdSprite 
	break
	
	case Room2:
	case Room2_1: sprite_index = birdSprite_1
	break
	
	case Room3:
	case Room3_1: sprite_index = birdSprite_2
	break
}
