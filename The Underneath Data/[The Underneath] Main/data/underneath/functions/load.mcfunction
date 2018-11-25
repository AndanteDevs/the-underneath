#@s - console
#called by #minecraft:load

#create module-dependent scoreboards
scoreboard objectives add TU.Main dummy [{"text":"[TU] ","color":"aqua"},{"text":"Main Scoreboard","color":"dark_aqua"}]
scoreboard objectives add TU.Tick dummy [{"text":"[TU] ","color":"aqua"},{"text":"Tick","color":"dark_aqua"}]
scoreboard objectives add TU.Version dummy [{"text":"[TU] ","color":"aqua"},{"text":"Build Count and Update Checks","color":"dark_aqua"}]
scoreboard objectives add TU.Independent dummy [{"text":"[TU] ","color":"aqua"},{"text":"Independent Variables","color":"dark_aqua"}]
#set scores
scoreboard players set ClockTick TU.Tick 16
scoreboard players set TickSecond TU.Independent 20

#notify of load and load other packs
tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"[The Underneath: Main] ","color":"aqua","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}},{"text":"Loaded main pack, loading other modules","color":"dark_aqua","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}]
tellraw @a[gamemode=!creative,gamemode=!spectator] [{"text":"[TU] ","color":"aqua"},{"text":"Loaded","color":"dark_aqua"}]

scoreboard players set AreOtherModules TU.Main 0
function #underneath:load_modules
execute if score AreOtherModules TU.Main matches 0 run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"[The Underneath: Main] ","color":"red","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}},{"text":"There are no other modules installed? Click here to install some.","color":"dark_red","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}]

#create regular scoreboards
#scoreboard objectives add TU.M_Scoreboard dummy [{"text":"[TU: Main] ","color":"aqua"},{"text":"A Scoreboard","color":"dark_aqua"}]

#update check
    #check for first time install
execute unless score main TU.Version matches 1.. run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"[The Underneath: Main] ","color":"yellow","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}},{"text":"Thank you for installing 'The Underneath' for the first time!","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}]
execute unless score main TU.Version matches 1.. run function #underneath:load_modules
    #store old build number
scoreboard players operation main.stored TU.Version = main TU.Version
    #set the build number
scoreboard players set main TU.Version 5
    #say update message if old and new build numbers are not the same
execute unless score main.stored TU.Version matches 0 unless score main TU.Version = main.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"[The Underneath: Main] ","color":"yellow","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}},{"text":"Updated to a new build number!","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}]
    #reset stored score
scoreboard players reset main.stored TU.Version