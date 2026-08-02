if alpha < 1
{
	alpha += 0.1
	alarm[1] = 7 * (delta_time / 16666.6667)
}
else
{
	alarm[2] = 50 * (delta_time / 16666.6667)
}