audio_stop_sound(justunpausethegamealready)


global.checkpointLifes = 21
global.checkpointProtection = false;

global.checkpointGotten = false
global.hasntDied = true
global.plusOneGotten = false

global.isBoss = false

global.musicBPM = 150; // Change for each song
global.beatOffset = 0.30; // Time in seconds until the first beat
global.chorus = 32
global.chorusEnd = 999999

with (cameraManager)
{
	cam_zoom = 0.5;
	cam_target_zoom = 0.5;
}