beatLength = 60 / global.musicBPM;

var pos = audio_sound_get_track_position(music) - global.beatOffset;
if global.master_volume > 0 && global.music_volume > 0
{
    var inChorus = (pos >= global.chorus - global.beatOffset &&
                    pos <= global.chorusEnd - global.beatOffset);

    // Just entered the chorus
    if (inChorus && !wasInChorus)
    {
        singThisChorus = (random(1) < 0.25); // random chance
		wasInChorus = true
		
		show_debug_message("Rolled: " + string(singThisChorus));
    }

    if (inChorus)
    {
        global.singing = singThisChorus;

            var currentBeat = floor(pos / beatLength);

            if (currentBeat != lastBeat)
            {
                lastBeat = currentBeat;

                with (cameraManager)
                {
                    cam_target_zoom = soundtrackManager.bopAmount;
                    cam_bob_target = -4;
                }
            }
       
    }
    else
    {
        global.singing = false;
		wasInChorus = false
    }
}

switch (global.bopAmount)
{
	case 0: bopAmount = 1 break
	case 1: bopAmount = 0.98 break
	case 2: bopAmount = 0.97 break
	case 3: bopAmount = 0.96 break
	case 4: bopAmount = 0.95 break
	case 5: bopAmount = 0.90 break
	case 6: bopAmount = 0.87 break
	
}


if (keyboard_check_pressed(189) && global.master_volume > 0)
{
    global.master_volume -= 0.2
    audio_master_gain(global.master_volume);
}

if (keyboard_check_pressed(187) && global.master_volume < 4)
{
    global.master_volume += 0.2
    audio_master_gain(global.master_volume);
}

if !(instance_exists(obj_pause_menu))
{
	audio_resume_sound(music);
	audio_sound_gain(music, global.music_volume, 0);
	
	
	if (audio_is_playing(justunpausethegamealready))
	{
		audio_stop_sound(justunpausethegamealready)
		audio_play_sound(unpauseSFX, 1, false);
	} 
}
else
{	
	audio_pause_sound(music)
	
	
	if (!audio_is_playing(justunpausethegamealready))
	{
	    audio_play_sound(justunpausethegamealready, 1, true, global.music_volume);
		audio_play_sound(pauseSFX, 1, false);
	}
}	

if (global.resumeMusicTimer > 0)
{
    global.resumeMusicTimer--;

    if (global.resumeMusicTimer <= 0)
    {
        audio_resume_sound(soundtrackManager.music);
		audio_resume_sound(Adventure_Awaits);
		audio_resume_sound(PlunderingIntoDarkness);
		audio_resume_sound(justunpausethegamealready);
		audio_resume_sound(StickeySituation);
    }
}
