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

camSpeed = 1

cam_zoom = 1;
cam_target_zoom = 1;

musicBPM = 150;
beatTimer = 0;
baseZoom = 1;
cam_target_zoom = baseZoom;

lookOffsetX = 0;
lookOffsetY = 0;

global.cameraLook = true

inputX = 0
inputY = 0

cam_bob = 0;
cam_bob_target = 0;

cam_w_previous = 480;
cam_h_previous = 270;