if (!place_meeting(x, y + yspeed, hitboxColObj))
{
    y += yspeed;
    yspeed += yGravity;
}
else
{
    yspeed = 0;
	
	if offGround
	{
		offGround = false
		cameraManager.shake = 90
	}
}

if image_index >= 67
{
	sprite_index = JumboSpriteLaugh
	alarm[0] = 4 * game_get_speed(gamespeed_fps)
}