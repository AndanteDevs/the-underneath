#@s - console
#called by #underneath:clock

#validity check
execute as @e[tag=TU.CC_CustomCrafter,type=minecraft:armor_stand] at @s unless block ~ ~ ~ minecraft:dropper[triggered=true]{Items:[]} run function underneath:custom_crafting/recipe_validity_check

#reset stack sizes/slot count on empty crafters
execute as @e[tag=TU.CC_CustomCrafter,type=minecraft:armor_stand] at @s unless block ~ ~ ~ minecraft:dropper{Items:[{}]} run scoreboard players set @s[scores={TU.CC_SlotCount=1..}] TU.CC_SlotCount 0
execute as @e[tag=TU.CC_CustomCrafter,type=minecraft:armor_stand] at @s unless block ~ ~ ~ minecraft:dropper{Items:[{}]} run scoreboard players set @s[scores={TU.CC_StackSize=1..}] TU.CC_StackSize 0

#recipe check
execute as @e[tag=TU.CC_CustomCrafter,type=minecraft:armor_stand] at @s unless block ~ ~ ~ minecraft:dropper{Items:[]} unless block ~ ~ ~ minecraft:dropper[triggered=true] run function #underneath:recipe_check

#creation check
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:crafting_table",Count:1b},OnGround:1b}] at @s if block ~ ~-1 ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:cobblestone",Count:1b},{Slot:1b,id:"minecraft:cobblestone",Count:1b},{Slot:2b,id:"minecraft:cobblestone",Count:1b},{Slot:3b,id:"minecraft:cobblestone",Count:1b},{Slot:5b,id:"minecraft:cobblestone",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:7b,id:"minecraft:redstone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]} unless entity @e[tag=TU.CC_CustomCrafter,type=minecraft:armor_stand,distance=..1] align xz run function underneath:custom_crafting/create