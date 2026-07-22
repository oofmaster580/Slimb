if instance_exists(obj_pause_menu) return;

y += yspeed
yspeed += gravityS

if place_meeting(x, y, hitboxColObj)
{
	instance_destroy()
}

if !global.godmode
{
	if x > room_width / 2
	{
		if(place_meeting(x, y, playerObj) && !global.isCutscene)
		{
		
			global.hasntDied = false
			global.diedThisGame = true
	
			global.lifes = max(0, global.lifes - 1);
			if !global.hoarderMod
			{
				global.points -= 100
			}
			global.levelLifes = false
			global.hasntDied = false
	
			instance_create_layer(playerObj.x, playerObj.y, "Player", DeathObj)
	
			playerObj.x = 88
			playerObj.y = 248
			playerObj.yspeed = playerObj.yspeed / 4
	
			audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
			global.deaths++
		}
	}
	else if x < room_width / 2
	{
		if(place_meeting(x, y, playerObj) && !global.isCutscene)
		{
		
			global.hasntDied = false
			global.diedThisGame = true
	
			global.lifes = max(0, global.lifes - 1);
			if !global.hoarderMod
			{
				global.points -= 100
			}
			global.levelLifes = false
			global.hasntDied = false
	
			instance_create_layer(playerObj.x, playerObj.y, "Player", DeathObj)
	
			playerObj.x = 392
			playerObj.y = 248
			playerObj.yspeed = playerObj.yspeed / 4
	
			audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
			global.deaths++
		}
	}
}

