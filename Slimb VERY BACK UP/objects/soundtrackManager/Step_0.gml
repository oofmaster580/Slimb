beatLength = 60 / global.musicBPM;

var pos = audio_sound_get_track_position(music) - global.beatOffset;
if global.master_volume > 0 && global.music_volume > 0
{
	if (pos >= global.chorus - global.beatOffset && pos <= global.chorusEnd  - global.beatOffset)
	{
	    var currentBeat = floor(pos / beatLength);

	    if (currentBeat != lastBeat)
	    {
	        lastBeat = currentBeat;

	        with (cameraManager)
	        {
	            cam_target_zoom = 0.95;
	        }
	    }
	}
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
