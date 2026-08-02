audio_stop_sound(Adventure_Awaits)


playerObj.checkpointX = playerObj.x
playerObj.checkpointY = playerObj.y

global.checkpointGotten = false
global.hasntDied = true
global.plusOneGotten = false

soundtrackManager.music = audio_play_sound(StickeySituation, 1, true, global.music_volume)

global.musicBPM = 120
global.beatOffset = -20.00

global.chorus = 56
global.chorusEnd = 89

with (cameraManager)
{
	cam_zoom = 0.5;
	cam_target_zoom = 0.5;
}