#@s - console
#called by #underneath:tick

#custom crafter brightness
execute as @e[tag=TU.CC_FireStand] run data merge entity @s {Fire:20s}
#remove check
execute as @e[type=minecraft:armor_stand,tag=TU.CC_CustomCrafter] at @s unless block ~ ~ ~ minecraft:dropper run function underneath:custom_crafting/remove