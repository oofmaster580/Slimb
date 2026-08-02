if sprite_alpha < 1
{
	sprite_alpha += 0.1
	alarm[0] = 7 * (delta_time / 16666.6667)
}
else
{
	alarm[1] = 15 * (delta_time / 16666.6667)
}