if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;
if global.cameraLook return;


timer--;

if room == TitleRoom || room == Room1 || room == Room1_1 || room == Room2 || room == Room2_1 || room == Room3 || room == Room3_1
{
	if (timer <= 0)
	{
	    // 25% chance to spawn a flock
	    var count = (random(1) <= 1) ? irandom_range(3, 4) : 1;

	    for (var i = 0; i < count; i++)
	    {
	        var b = instance_create_layer(0, 0, "Collision", objBird);

	        // Spread the flock a little
	        b.x -= i * 16 * b.dir;
	        b.start_y += random_range(-8, 8);
	    }

	    timer = irandom_range(timeSpeed * 10, timeSpeed * 25);
	}
}
else
{
	timer = timeSpeed * 33;
}