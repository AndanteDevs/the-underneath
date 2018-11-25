#@s - mob that 'shouldn't be there' in the underneath
#called by underneath:dimension/tick

execute as @s[type=minecraft:zombie_villager] run summon minecraft:illusioner ~ ~ ~
execute as @s[type=minecraft:spider] run summon minecraft:cave_spider ~ ~ ~
execute as @s[type=minecraft:skeleton] run summon minecraft:wither_skeleton ~ ~ ~ {HandItems:[{id:"minecraft:bow",Count:1},{}]}
execute as @s[type=minecraft:creeper] run data merge entity @s {ignited:1,Tags:["TU.D_NoKill"]}
execute as @s[type=minecraft:bat] run summon minecraft:creeper ~ ~ ~ {Tags:["TU.D_NoReplace"]}

data merge entity @s[tag=!TU.D_NoKill] {Health:0,DeathTime:18,DeathLootTable:"minecraft:empty"}