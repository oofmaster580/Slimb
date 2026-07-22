if place_meeting(x, y, fallingJumbo)
{
	global.sceneTarget = fallingJumbo
	instance_destroy()
}

if global.isCutscene
{
	image_index = 0
}