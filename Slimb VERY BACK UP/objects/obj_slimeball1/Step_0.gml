if instance_exists(obj_pause_menu) return;

y -= 10

if y < -25
{
	instance_create_layer(playerObj.x, y, "JumboObj", obj_slimeball2)
	instance_destroy()
}