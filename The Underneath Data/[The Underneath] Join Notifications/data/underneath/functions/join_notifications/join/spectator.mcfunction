#@s - joined player in spectator mode
#called by underneath:join_notifications/tick

#particles and sounds
particle minecraft:firework ~ ~ ~ .5 1 .5 .1 100 normal @s
playsound minecraft:entity.firework_rocket.launch voice @s ~ ~ ~ 100 1 1

#text
tellraw @s [{"text":"[TU] ","color":"aqua"},{"text":"Welcome, ","color":"dark_aqua"},{"selector":"@s","color":"dark_aqua"},{"text":"!","color":"dark_aqua"}]

#give server joined notification
tag @s add TU.JN_Joined
scoreboard players set @s TU.JN_LeaveGame 0