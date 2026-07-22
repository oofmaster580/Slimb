audio_stop_sound(Slimb)
audio_stop_sound(justunpausethegamealready_1)

global.checkpointLifes = 21
global.checkpointProtection = false;
global.amountRuns++

if global.excMod
{
	global.lifes = 1
}

global.isBoss = false

soundtrackManager.music = audio_play_sound(Long_Journey__Longer_Fall, 1, true, global.music_volume)

global.musicBPM = 110
global.beatOffset = 0.00

global.chorus = 61
global.chorusEnd = 70

with (cameraManager)
{
	cam_zoom = 0.5;
	cam_target_zoom = 0.5;
}

if global.hoarderMod {global.points = 5}