audio_stop_sound(StickeySituation)
audio_stop_sound(Adventure_Awaits)

playerObj.checkpointX = playerObj.x
playerObj.checkpointY = playerObj.y

global.checkpointGotten = false
global.hasntDied = true
global.plusOneGotten = false

soundtrackManager.music = audio_play_sound(PlunderingIntoDarkness, 1, true, global.music_volume)

with (cameraManager)
{
	cam_zoom = 0.5;
	cam_target_zoom = 0.5;
}