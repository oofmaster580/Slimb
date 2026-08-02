if playerObj.x < x
{
	image_xscale = 1	
}
else
{
	image_xscale = -1
}

if global.cameraLook || instance_exists(dialogBoxObj) || instance_exists(obj_pause_menu) {image_speed = 0} else {image_speed = 1}