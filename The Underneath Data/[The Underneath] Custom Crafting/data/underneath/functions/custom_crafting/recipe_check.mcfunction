#@s = custom crafter unless block ~ ~ ~ minecraft:dropper{Items:[]}
#called by underneath:custom_crafting/clock

#mossy cobblestone from seeds
execute if block ~ ~ ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:wheat_seeds",Count:1b},{Slot:1b,id:"minecraft:wheat_seeds",Count:1b},{Slot:2b,id:"minecraft:wheat_seeds",Count:1b},{Slot:3b,id:"minecraft:wheat_seeds",Count:1b},{Slot:4b,id:"minecraft:cobblestone",Count:8b},{Slot:5b,id:"minecraft:wheat_seeds",Count:1b},{Slot:6b,id:"minecraft:wheat_seeds",Count:1b},{Slot:7b,id:"minecraft:wheat_seeds",Count:1b},{Slot:8b,id:"minecraft:wheat_seeds",Count:1b}]} run data merge block ~ ~ ~ {Items:[{Slot:4b,id:"minecraft:mossy_cobblestone",Count:8b}]}
#mossy cobblestone to counterparts
execute if block ~ ~ ~ minecraft:dropper{Items:[{Slot:4b,id:"minecraft:mossy_cobblestone",Count:3b},{Slot:8b,id:"minecraft:flint",Count:3b}]} run data merge block ~ ~ ~ {Items:[{Slot:4b,id:"minecraft:cobblestone",Count:3b},{Slot:7b,id:"minecraft:vine",Count:3b},{Slot:8b,id:"minecraft:flint",Count:1b}]}