if instance_exists(obj_pause_menu) || instance_exists(dialogBoxObj) return;

image_angle += swingSpeed

if(place_meeting(x, y, playerObj) && !global.godmode)
{
	global.lifes = max(0, global.lifes - 1);
	if !global.hoarderMod
	{
		global.points -= 100
	}
	global.levelLifes = false
	
	instance_create_layer(playerObj.x, playerObj.y, "Player", DeathObj)
	
	playerObj.x = playerObj.checkpointX
	playerObj.y = playerObj.checkpointY
	playerObj.yspeed = playerObj.yspeed / 4
	
	audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
	
}
