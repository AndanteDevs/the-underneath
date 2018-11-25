#@s - @e[type=minecraft:item,nbt={CRAFTING_TABLE}] if block ~ ~-1 ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:cobblestone",Count:1b},{Slot:1b,id:"minecraft:cobblestone",Count:1b},{Slot:2b,id:"minecraft:cobblestone",Count:1b},{Slot:3b,id:"minecraft:cobblestone",Count:1b},{Slot:5b,id:"minecraft:cobblestone",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:7b,id:"minecraft:redstone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]}
#called by #underneath:custom_crafting/clock

#create stand
summon minecraft:armor_stand ~.5 ~-.9 ~.5 {ArmorItems:[{},{},{},{id:"minecraft:crafting_table",Count:1b}],Tags:["TU.Entity","TU.CC_FireStand","TU.CC_CustomCrafter"],NoGravity:1,Small:1,Marker:1,Invisible:1,CustomNameVisible:0,CustomName:"\"TU.CC_CustomCrafter\""}
data merge block ~ ~-1 ~ {CustomName:"\"Custom Crafter\"",Items:[]}
clone ~ ~-1 ~ ~ ~-1 ~ ~ 0 ~ replace force
setblock ~ ~-1 ~ minecraft:air
clone ~ 0 ~ ~ 0 ~ ~ ~-1 ~ replace force
setblock ~ 0 ~ minecraft:obsidian
execute align xz positioned ~.5 ~ ~.5 run scoreboard players set @e[type=minecraft:armor_stand,tag=TU.CC_BasicCrafter,distance=...5] TU.CC_StckMltplr 1
playsound minecraft:block.beacon.activate voice @a[distance=..16] ~ ~ ~ 100 1.5 1
playsound minecraft:block.beacon.activate voice @a[distance=..16] ~ ~ ~ 100 .5 1
advancement grant @a[distance=..6] only underneath:custom_crafting
kill @s[type=!minecraft:player]