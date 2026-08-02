if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;
if global.cameraLook return;

x += hspeedt
y += vspeedt

switch (state)
{
    case 0:
        image_alpha += fade_speed;

        if (image_alpha >= 1)
        {
            image_alpha = 1;
            state = 1;
        }
    break;

    case 1:
        wait_timer--;

        if (wait_timer <= 0)
            state = 2;
    break;

    case 2:
        image_alpha -= fade_speed;

        if (image_alpha <= 0)
            instance_destroy();
    break;
}