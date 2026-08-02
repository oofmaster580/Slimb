image_index = index
sprite_index = sprite

if (instance_exists(obj_pause_menu)) || global.cameraLook || instance_exists(dialogBoxObj) return;

fadeTimer--;

if (fadeTimer > 0) return;

fadeTimer = 5;

if (image_alpha > 0)
{
    image_alpha -= 0.25;
}
else
{
    instance_destroy();
}