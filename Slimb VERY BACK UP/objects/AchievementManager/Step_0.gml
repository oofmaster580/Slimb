if global.deaths >= 50
{
    Achievement(19)
}

if global.deaths >= 100
{
    Achievement(20)
}

if collision_point(playerObj.x, playerObj.y, wastedTimeTrigger, false, true)
{
    Achievement(21)
}

global.hasntMoved += delta_time / 1000000;
show_debug_message(global.hasntMoved)
//show_debug_message(delta_time);

if keyboard_check(vk_anykey)
{
	global.hasntMoved = 0
}

if global.hasntMoved >= 300
{
    Achievement(22)
}

function Achievement(value)
{
    if (!array_contains(global.hatsUnlocked, value))
    {
        global.hatsUnlocked[array_length(global.hatsUnlocked)] = value;
		
		if !audio_is_playing(AchievementSFX)
		{
			audio_play_sound(AchievementSFX, 1, false, global.music_volume);
		}

        audio_group_set_gain(audiogroup_default, 0, 30);
		global.hatSelected = value

        alarm[0] = audio_sound_length(AchievementSFX) * game_get_speed(gamespeed_fps);
    }
}


function MegaAchievement(value)
{
    if (!array_contains(global.hatsUnlocked, value))
    {
        global.hatsUnlocked[array_length(global.hatsUnlocked)] = value;
		
		audio_stop_sound(AchievementSFX)
		
		if !audio_is_playing(AchievementSFX)
		{
			audio_play_sound(OmegaAchievement, 1, false, global.music_volume);
		}

        audio_group_set_gain(audiogroup_default, 0, 30);
		global.hatSelected = value

        alarm[0] = audio_sound_length(OmegaAchievement) * game_get_speed(gamespeed_fps);
    }
}

/*
if keyboard_check(ord("M")) && keyboard_check(ord("O")) && keyboard_check(ord("P"))
{
	global.deaths = 0
	global.hatsUnlocked = [0]
}
*/

var hasAll = true;

for (var i = 1; i <= 23; i++)
{
    if (!array_contains(global.hatsUnlocked, i))
    {
        hasAll = false;
        break;
    }
}

if (hasAll)
{
    MegaAchievement(12)
}

/*
show_debug_message("Checkpoint: " + string(global.checkpointGotten))
show_debug_message("Hasnt Died: " + string(global.hasntDied))
show_debug_message("PlusOne: " + string(global.plusOneGotten))