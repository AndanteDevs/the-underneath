#@s - console
#called by underneath:dimension/custom_crafting/recipe_check

#kill items
kill @e[type=minecraft:item,distance=...5]
#create portal
setblock ~ ~ ~ minecraft:end_gateway
execute align xz run summon minecraft:armor_stand ~.5 ~ ~.5 {CustomName:"\"TU.D_UnderneathPortal\"",Tags:["TU.Entity","TU.D_UnderneathPortal"],Invisible:1,Marker:1,Small:1,NoGravity:1}