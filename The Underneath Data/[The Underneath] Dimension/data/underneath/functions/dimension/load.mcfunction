#@s - console
#called by #minecraft:load

#notify of load
scoreboard players set AreOtherModules TU.Main 1

#create scoreboards
scoreboard objectives add TU.D_TelprtTick dummy [{"text":"[TU: D] ","color":"blue"},{"text":"Teleport Tick","color":"dark_blue"}]
scoreboard objectives add TU.D_TelprtTickS dummy [{"text":"[TU: D] ","color":"blue"},{"text":"Teleport Tick (in seconds)","color":"dark_blue"}]
scoreboard objectives add TU.D_Sneak minecraft.custom:minecraft.sneak_time [{"text":"[TU: D] ","color":"blue"},{"text":"Sneak Check","color":"dark_blue"}]
scoreboard objectives add TU.D_PosY dummy [{"text":"[TU: D] ","color":"blue"},{"text":"Y Pos","color":"dark_blue"}]

#update check
    #store old build number
scoreboard players operation dimension.stored TU.Version = dimension TU.Version
    #set the build number
scoreboard players set dimension TU.Version 3
    #say update message if old and new build numbers are not the same
execute unless score dimension.stored TU.Version matches 0 unless score dimension TU.Version = dimension.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded Dimension with a new build number","color":"dark_blue","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #load normally if no updates
execute if score dimension TU.Version = dimension.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded Dimension","color":"dark_blue","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #reset stored score
scoreboard players reset dimension.stored TU.Version

#ensure safe portal spawn
execute in minecraft:overworld run fill -2 20 -2 1 23 1 minecraft:air replace
execute in minecraft:overworld run fill -2 19 -2 1 19 1 minecraft:bedrock