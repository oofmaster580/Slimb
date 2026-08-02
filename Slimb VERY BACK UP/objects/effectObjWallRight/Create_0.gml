image_index = random_range(0, 5)

moveX = random_range(0, 2)
moveY = random_range(-0.5, 0.5)

alarm[0] = 10 

switch (room)
{
	case Room1: sprite_index = effectSpr break
	case Room2: sprite_index = effectSpr_1 break
	case Room2_1: sprite_index = effectSpr_1 break
	case Room3: sprite_index = effectSpr_2 break
	case Room3_1: sprite_index = effectSpr_2 break
	case jumboRoom: sprite_index = effectSpr_2 break
}