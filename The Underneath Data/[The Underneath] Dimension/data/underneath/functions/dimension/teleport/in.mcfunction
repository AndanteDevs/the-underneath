#@s - player in an underneath portal
#called by underneath:dimension/clock

advancement grant @s[nbt={RootVehicle:{}}] only underneath:enter_the_underneath.on_vehicle
execute in minecraft:overworld run fill -2 20 -2 1 23 1 minecraft:air destroy
particle minecraft:witch ~ ~ ~ 1 1 1 .5 1000 normal @a
particle minecraft:witch 0 20 0 1 1 1 .5 1000 normal @a
playsound minecraft:block.portal.travel voice @s ~ ~ ~ 100 1 1
execute in minecraft:the_end run tp @s 0 512 0
execute in minecraft:overworld run tp @s 0 20 0
title @s actionbar {"text":"Teleported!","color":"blue"}
scoreboard players set @s TU.D_TelprtTick 0