#@s - console
#called by #underneath:load_modules

#notify of load
scoreboard players set AreOtherModules TU.Main 1

#create scoreboards
#scoreboard objectives add TU.MODULE_INITIALS_OBJECTIVE_NAME OBJECTIVE_CRITERIA [{"text":"[TU: MODULE_INITIALS] ","color":"COLOR_ID.light"},{"text":"OBJECTIVE_NAME","color":"COLOR_ID.dark"}]

#update check
    #store old build number
scoreboard players operation module_id.stored TU.Version = module_id TU.Version
    #set the build number
scoreboard players set module_id TU.Version 1
    #say update message if old and new build numbers are not the same
execute unless score module_id.stored TU.Version matches 0 unless score module_id TU.Version = module_id.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded MODULE_NAME with a new build number","color":"COLOR_ID.dark","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #load normally if no updates
execute if score module_id TU.Version = module_id.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded MODULE_NAME","color":"dark_purple","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #reset stored score
scoreboard players reset module_id.stored TU.Version
