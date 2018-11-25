#@s - console
#called by underneath:dimension/custom_crafting/recipe_check

#remove portal
setblock ~ ~ ~ minecraft:air replace
execute align xz run kill @e[type=minecraft:armor_stand,tag=TU.D_UnderneathPortal,distance=..1]
#summon items
summon minecraft:area_effect_cloud ~ ~ ~ {Passengers:[{id:"minecraft:item",Item:{id:"minecraft:ender_pearl",Count:1b}},{id:"minecraft:item",Item:{id:"minecraft:crafting_table",Count:1b}}]}