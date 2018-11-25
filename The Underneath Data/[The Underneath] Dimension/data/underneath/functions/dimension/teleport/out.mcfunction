#@s - player sneaking at Y=..4
#called by underneath:dimension/clock

particle minecraft:witch ~ ~ ~ 1 1 1 .5 1000 normal @a
particle minecraft:witch 0 20 0 1 1 1 .5 1000 normal @a
playsound minecraft:block.portal.travel voice @s ~ ~ ~ 100 1 1
execute in minecraft:the_end run tp @s 0 512 0
execute in minecraft:overworld run tp @s 0 255 0
spreadplayers ~ ~ 1 1 false @s
effect give @s minecraft:resistance 10 255 true
title @s actionbar {"text":"Teleported!","color":"blue"}
scoreboard players set @s TU.D_TelprtTick 0