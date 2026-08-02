if !instance_exists(obj_pause_menu) && !instance_exists(dialogBoxObj) && room != TitleRoom && !global.hoarderMod && !global.isBoss && !global.isCutscene {global.points -= 5};
if !instance_exists(obj_pause_menu) && !instance_exists(dialogBoxObj) && room != TitleRoom && !global.isBoss && !global.isCutscene && global.hoarderMod {global.points--}

alarm[0] = 60