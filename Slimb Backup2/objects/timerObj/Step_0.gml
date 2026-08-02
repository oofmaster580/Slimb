timerFrames++;


if (timerFrames >= 0.6 && !instance_exists(obj_pause_menu) && !instance_exists(dialogBoxObj) && room != TitleRoom && !global.cameraLook)
{
    global.timer += delta_time / 1000000;
    timerFrames = 0;
}

//show_debug_message(global.roomTime)

if (global.timer >= global.roomTime)
{
    if (!roomTimeExceeded)
    {
        roomTimeExceeded = true;
        audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.3, 0.4))
    }

    roomTimeAlpha = max(roomTimeAlpha - 0.02, 0);
}
else
{
    roomTimeAlpha = 1;
    roomTimeExceeded = false;
}

switch(room)
{
	case TitleRoom:
		global.roomTime = 9999999999999999999999999999999999999999999999
		roomTimeText = "NULL"
	break
	
	case Room1:
		global.roomTime = 15
		roomTimeText = "0:15.00"
	break
	
	case Room1_1:
		global.roomTime = 45
		roomTimeText = "0:45.00"
	break
	
	case Room2:
		global.roomTime = 80
		roomTimeText = "1:20.00"
	break
	
	case Room2_1:
		global.roomTime = 150
		roomTimeText = "2:30.00"
	break
	
	case Room3:
		global.roomTime = 195
		roomTimeText = "3:15.00"
	break
	
	case Room3_1:
		global.roomTime = 300
		roomTimeText = "5:00.00"
	break
	
	case jumboRoom:
		global.roomTime = 195
		roomTimeText = "3:15.00"
	break
}