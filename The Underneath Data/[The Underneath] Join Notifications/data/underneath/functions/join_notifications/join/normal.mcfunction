#@s - joined player not in spectator mode
#called by underneath:join_notifications/tick

#particles and sounds
particle minecraft:firework ~ ~ ~ .5 1 .5 .1 100 normal @a
execute as @s[gamemode=!creative] run playsound minecraft:entity.firework_rocket.launch voice @a ~ ~ ~ 100 1 1
execute as @s[gamemode=creative] run summon minecraft:firework_rocket ~ ~1 ~ {LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:1b,Explosions:[{FadeColors:[I;14188952]}]}}}}
#text
tellraw @s [{"text":"[TU] ","color":"aqua"},{"text":"Welcome, ","color":"dark_aqua"},{"selector":"@s","color":"dark_aqua"},{"text":"!","color":"dark_aqua"}]
#effects
effect give @s[gamemode=!creative,nbt=!{ActiveEffects:[{Id:11b}]}] minecraft:resistance 10 9
effect give @s[gamemode=!creative,nbt=!{ActiveEffects:[{Id:12b}]}] minecraft:fire_resistance 10 0 true
#give server joined notification
tag @s add TU.JN_Joined
scoreboard players set @s TU.JN_LeaveGame 0