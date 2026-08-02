if instance_exists(obj_pause_menu) || instance_exists(dialogBoxObj) return;
if global.cameraLook return;

image_angle += swingSpeed

if(place_meeting(x, y, playerObj) && !global.godmode)
{
	killPlayerDefault()
}
