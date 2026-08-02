audio_stop_sound(Yikes__Even_More_Spikes_)
audio_stop_sound(Long_Journey__Longer_Fall)

playerObj.checkpointX = playerObj.x
playerObj.checkpointY = playerObj.y

global.checkpointGotten = false
global.hasntDied = true
global.plusOneGotten = false

soundtrackManager.music = audio_play_sound(MireMassacre, 1, true, global.music_volume)

with (cameraManager)
{
	cam_zoom = 0.5;
	cam_target_zoom = 0.5;
}