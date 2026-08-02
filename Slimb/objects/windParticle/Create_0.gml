image_alpha = 0;

fade_speed = 0.03;

state = 0; // 0 = fade in, 1 = wait, 2 = fade out

wait_timer = irandom_range(30, 90);

// Slow drifting
hspeedt = random_range(-0.2, 0.2);
vspeedt = random_range(-0.2, 0.2);

// Random sprite frame
image_index = irandom(sprite_get_number(sprite_index) - 1);
image_speed = 0;

switch (room)
{
	case Room1:
	case Room1_1:
	case TitleRoom: sprite_index = particle1 
	break
	
	case Room2:
	case Room2_1: sprite_index = particle1_1
	break
	
	case Room3:
	case Room3_1: sprite_index = particle1_2
	break
}
