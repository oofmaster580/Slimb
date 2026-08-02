if (instance_exists(dialogBoxObj))
{
	with (cameraManager)
	{
		cam_zoom = 1;
		cam_target_zoom = 1;
	}
}

if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;

	// Target
	if (!global.isCutscene) && room != MainMenu
	{
	    target = playerObj;
	}
	else
	{
	    target = global.sceneTarget;
	}

	if instance_exists(playerObj) && playerObj.freeCamera 
	{
		global.cameraLook = true
	}
	else
	{
		global.cameraLook = false
	}

	// Smooth zoom
	cam_zoom = lerp(cam_zoom, cam_target_zoom, 0.15);

	// Return to normal
	cam_target_zoom = lerp(cam_target_zoom, 1, 0.12);

	// Camera size
	var base_w = 480;
	var base_h = 270;

	var cam_w = round(base_w * cam_zoom);
	var cam_h = round(base_h * cam_zoom);

	// Keep camera centered when viewport size changes
	var center_x = x + cam_w_previous / 2;
	var center_y = y + cam_h_previous / 2;

	// Apply viewport zoom
	camera_set_view_size(view_camera[0], cam_w, cam_h);

	// Recenter viewport
	x = center_x - cam_w / 2;
	y = center_y - cam_h / 2;

	// Save current size
	cam_w_previous = cam_w;
	cam_h_previous = cam_h;

	// Target position
	var target_x = target.x - cam_w / 2;
	var target_y = target.y - cam_h / 2;

	// Look-ahead
	var look = 48;
	target_x += sign(target.x - target.xprevious) * look;

	// Smooth follow
	var follow_speed = 0.12;

	x = lerp(x, target_x, follow_speed);
	y = lerp(y, target_y, follow_speed);
	
	switch (global.freeCamSpeed)
	{
		case 1: camSpeed = 2 break
		case 2: camSpeed = 4 break
		case 3: camSpeed = 8 break
		case 4: camSpeed = 16 break
	}

	// Camera look
	if (global.cameraLook)
	{
	    inputX += playerObj.right - playerObj.left
	    inputY += playerObj.down - playerObj.up

	    lookOffsetX = lerp(lookOffsetX, inputX * camSpeed, 0.15);
	    lookOffsetY = lerp(lookOffsetY, inputY * camSpeed, 0.15);
	}
	else
	{
	    lookOffsetX = lerp(lookOffsetX, 0, 0.15);
	    lookOffsetY = lerp(lookOffsetY, 0, 0.15);
		
		inputX = 0
		inputY = 0
	}

	// Camera shake
	var shake_x = 0;
	var shake_y = 0;

	if (shake > 0)
	{
	    var angle = random(360);
	    var dist = random(shake);

	    shake_x = lengthdir_x(dist, angle);
	    shake_y = lengthdir_y(dist, angle);

	    shake *= shakeFade;

	    if (shake < 0.1)
	    {
	        shake = 0;
	    }
	}
	
	// Camera bob
	cam_bob = lerp(cam_bob, cam_bob_target, 0.2);
	cam_bob_target = lerp(cam_bob_target, 0, 0.15);

	// Camera position with look offset
	var camera_x = x + lookOffsetX + shake_x;
	var camera_y = y + lookOffsetY + cam_bob + shake_y;

	// Allow the camera to go slightly outside the room
	var camera_margin = 64;

	// Clamp camera
	camera_x = clamp(
	    camera_x,
	    -camera_margin,
	    room_width - cam_w + camera_margin
	);

	camera_y = clamp(
	    camera_y,
	    -camera_margin,
	    room_height - cam_h + camera_margin
	);

	// Apply camera
	camera_set_view_pos(
	    view_camera[0],
	    round(camera_x),
	    round(camera_y)
	);

	// Clamp for next frame
	x = clamp(x, 0, room_width - cam_w);
	y = clamp(y, 0, room_height - cam_h);
