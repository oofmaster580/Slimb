global.isCutscene = false
global.sceneTarget = lookingTarget

shake = 0;
shakeFade = 0.96

target = lookingTarget;

if instance_exists(playerObj)
{
	target = playerObj;
	camera_set_view_pos(
	    view_camera[0],
	    playerObj.x,
	    playerObj.y
	);
}

cam_zoom = 1;
cam_target_zoom = 1;

musicBPM = 150;
beatTimer = 0;
baseZoom = 1;
cam_target_zoom = baseZoom;