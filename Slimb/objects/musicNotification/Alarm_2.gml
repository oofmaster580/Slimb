if alpha > 0
{
	alpha -= 0.1
	sprite_alpha -= 0.1
	alarm[2] = 7 * (delta_time / 16666.6667)
}
else
{
	instance_destroy()
}