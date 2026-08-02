if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;
if global.cameraLook return;

spawn_timer--;

if global.singing
{
	if (spawn_timer <= 0)
	{
	    var cam = view_camera[0];

	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
	    var cam_w = camera_get_view_width(cam);
	    var cam_h = camera_get_view_height(cam);

	    instance_create_layer(
	        irandom_range(playerObj.x + 4, playerObj.x - 4),
	        playerObj.y - 10,
	        "effects",
	        noteObj
	    );

	    spawn_timer = irandom_range(40, 60);
	}
}