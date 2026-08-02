image_index = random_range(0, 4)

image_xscale = random_range(0.5, 0.6)
image_yscale = image_xscale

if room == MainMenu
{
	sprite_index = cloud
}
else if room == Room1 || room == Room1_1
{
	sprite_index = cloud
}
else if room == Room2 || room == Room2_1
{
	sprite_index = cloud_1
}
else if room == Room3 || room == Room3_1
{
	sprite_index = cloud_2
}
else if room == jumboRoom
{
	sprite_index = cloud_2
}
else
{
	sprite_index = cloud
}