#@s - console
#called by #underneath:load_modules

#notify of load
scoreboard players set AreOtherModules TU.Main 1

#warn render distance
title @a actionbar [{"text":"[TU: World Generation] ","color":"green"},{"text":"Make sure your render distance is set to 4 or higher","color":"dark_green"}]

#create scoreboards


#update check
    #store old build number
scoreboard players operation world_generation.stored TU.Version = world_generation TU.Version
    #set the build number
scoreboard players set world_generation TU.Version 3
    #say update message if old and new build numbers are not the same
execute unless score world_generation.stored TU.Version matches 0 unless score world_generation TU.Version = world_generation.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded World Generation with a new build number","color":"dark_green","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #load normally if no updates
execute if score world_generation TU.Version = world_generation.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded World Generation","color":"dark_green","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #reset stored score
scoreboard players reset world_generation.stored TU.Version