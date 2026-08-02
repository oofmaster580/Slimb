if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;

if room != MainMenu
{
	// Target
	if (!global.isCutscene)
	{
		target = playerObj;
	}
	else
	{
	    target = global.sceneTarget;
	}

	if (keyboard_check_pressed(ord("G")))
	{
	    global.isCutscene = !global.isCutscene;
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

	// Apply viewport zoom
	camera_set_view_size(view_camera[0], cam_w, cam_h);

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
	    if (shake < 0.1) shake = 0;
	}

	// Apply camera FIRST
	camera_set_view_pos(
	    view_camera[0],
	    round(x + shake_x),
	    round(y + shake_y)
	);

	// THEN clamp for next frame
	x = clamp(x, 0, room_width - cam_w);
	y = clamp(y, 0, room_height - cam_h);
}

if room == MainMenu
{
	if (instance_exists(dialogBoxObj)) return;
	if (instance_exists(obj_pause_menu)) return;

	// Target
	if (!global.isCutscene)
	{
	    target = global.sceneTarget;
	}
	else
	{
	    target = global.sceneTarget;
	}

	if (keyboard_check_pressed(ord("G")))
	{
	    global.isCutscene = !global.isCutscene;
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

	// Apply viewport zoom
	camera_set_view_size(view_camera[0], cam_w, cam_h);

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
	    if (shake < 0.1) shake = 0;
	}

	// Apply camera FIRST
	camera_set_view_pos(
	    view_camera[0],
	    round(x + shake_x),
	    round(y + shake_y)
	);

	// THEN clamp for next frame
	x = clamp(x, 0, room_width - cam_w);
	y = clamp(y, 0, room_height - cam_h);
}