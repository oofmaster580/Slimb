points = global.points

image_alpha = 0

for (var i = 0; i < array_length(global.talkedInvisDialogue); i++)
{
    if (global.talkedInvisDialogue[i] == ID)
    {
        instance_destroy();
        break;
    }
}

if !place_meeting(x, y, playerObj) || collision_point(playerObj.x, playerObj.y, transitionFloorObj, false, true) || collision_point(playerObj.x, playerObj.y, checkpointObj, false, true) 
{
	image_index = 0
}
else
{
	image_index = 1
}

// Start dialogue
if (!instance_exists(dialogBoxObj)) && !collision_point(playerObj.x, playerObj.y, transitionFloorObj, false, true) && !collision_point(playerObj.x, playerObj.y, checkpointObj, false, true) && (!instance_exists(obj_pause_menu))
{
    if (place_meeting(x, y, playerObj))
    {
		
		points = global.points
		
        talking = true;
        dialog_index = 0;

        dialog_box = instance_create_layer(
            camera_get_view_x(view_camera[0]),
            camera_get_view_y(view_camera[0]),
            "managers",
            dialogBoxObj
        );

        dialog_box.full_text = dialog[dialog_index];
		dialog_box.text = "";
		dialog_box.char_index = 0;
		
		dialog_box.name = name;
    }
}
else if (talking)
{
    // Advance dialogue
    if (playerObj.interact)
    {
        if (dialog_box.char_index < string_length(dialog_box.full_text))
        {
            dialog_box.char_index = string_length(dialog_box.full_text);
            dialog_box.text = dialog_box.full_text;
        }
        else
        {
            dialog_index++;

            if (dialog_index >= array_length(dialog))
            {
                talking = false;

                if (instance_exists(dialog_box))
                    instance_destroy(dialog_box);
				
				array_push(global.talkedInvisDialogue, ID);
				instance_destroy()
            }
            else
            {
                dialog_box.full_text = dialog[dialog_index];
                dialog_box.text = "";
                dialog_box.char_index = 0;
            }
        }
    }
}