#@s - console
#called by #underneath:load_modules

#notify of load
scoreboard players set AreOtherModules TU.Main 1

#create scoreboards
scoreboard objectives add TU.JN_LeaveGame minecraft.custom:minecraft.leave_game [{"text":"[TU: JN] ","color":"light_purple"},{"text":"Leave Game Check","color":"dark_purple"}]

#update check
    #store old build number
scoreboard players operation join_notifications.stored TU.Version = join_notifications TU.Version
    #set the build number
scoreboard players set join_notifications TU.Version 2
    #say update message if old and new build numbers are not the same
execute unless score join_notifications.stored TU.Version matches 0 unless score join_notifications TU.Version = join_notifications.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded Join Notifications with a new build number","color":"dark_purple","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #load normally if no updates
execute if score join_notifications TU.Version = join_notifications.stored TU.Version run tellraw @a[gamemode=!survival,gamemode=!adventure] {"text":" - Loaded Join Notifications","color":"dark_purple","clickEvent":{"action":"open_url","value":"https://github.com/AndanteDevs/TheUnderneath/releases"}}
    #reset stored score
scoreboard players reset join_notifications.stored TU.Version