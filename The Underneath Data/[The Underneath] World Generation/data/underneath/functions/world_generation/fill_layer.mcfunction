#@s - player
#called by underneath:world_generation/tick

#fill layers
fill ~63 0 ~63 ~-63 0 ~-63 minecraft:obsidian replace
fill ~63 40 ~63 ~-63 40 ~-63 minecraft:bedrock replace
#notify player
title @s actionbar [{"text":"[TU: World Generation] ","color":"red"},{"text":"You may lag while new terrain is being generated","color":"dark_red"}]