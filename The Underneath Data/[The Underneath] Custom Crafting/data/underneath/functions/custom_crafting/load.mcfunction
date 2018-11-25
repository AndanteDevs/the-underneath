#@s - console
#called by #underneath:load_modules

#notify of load
scoreboard players set AreOtherModules TU.Main 1

#create scoreboards
scoreboard objectives add TU.CC_FstStckSze dummy [{"text":"[TU: CC] ","color":"red"},{"text":"First Item Slot Stack Size","color":"dark_red"}]
scoreboard objectives add TU.CC_SlotCount dummy [{"text":"[TU: CC] ","color":"red"},{"text":"Slot Count","color":"dark_red"}]
scoreboard objectives add TU.CC_StackSize dummy [{"text":"[TU: CC] ","color":"red"},{"text":"Stack Size Check","color":"dark_red"}]
scoreboard objectives add TU.CC_NewStckSze dummy [{"text":"[TU: CC] ","color":"red"},{"text":"New Stack Size","color":"dark_red"}]
scoreboard objectives add TU.CC_TagCount dummy [{"text":"[TU: CC] ","color":"red"},{"text":"First Item Tag Count","color":"dark_red"}]

#update check
    #store old build number
scoreboard players operation custom_crafting.stored TU.Version = custom_crafting TU.Version
    #set the build number
scoreboard players set custom_crafting TU.Version 2
    #say update message if old and new build numbers are not the same
execute unless score custom_crafting.stored TU.Version matches 0 unless score custom_crafting TU.Version = custom_crafting.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded Custom Crafting with a new build number","color":"dark_red","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #load normally if no updates
execute if score custom_crafting TU.Version = custom_crafting.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded Custom Crafting","color":"dark_red","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #reset stored score
scoreboard players reset custom_crafting.stored TU.Version