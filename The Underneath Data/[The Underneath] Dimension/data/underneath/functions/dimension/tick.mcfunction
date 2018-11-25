#@s - console
#called by #underneath:tick

#teleport new players to spawn
tp @a[tag=!TU.D_JoinedOnce] 0 256 0
effect give @a[tag=!TU.D_JoinedOnce] minecraft:resistance 10 255 true
tag @a[tag=!TU.D_JoinedOnce] add TU.D_JoinedOnce

#run teleport checks
scoreboard players reset * TU.D_PosY
execute as @a store result score @s TU.D_PosY run data get entity @s Pos[1]
execute as @e[type=minecraft:item] store result score @s TU.D_PosY run data get entity @s Pos[1]
    #in
execute at @e[tag=TU.D_UnderneathPortal] run scoreboard players add @a[distance=...8,gamemode=!spectator] TU.D_TelprtTick 1
execute at @e[tag=TU.D_UnderneathPortal] run scoreboard players set @a[distance=...8,gamemode=creative,scores={TU.D_TelprtTick=..98}] TU.D_TelprtTick 99
execute at @e[tag=TU.D_UnderneathPortal] as @a[distance=...8,scores={TU.D_TelprtTick=100..}] run function underneath:dimension/teleport/in

execute as @a[scores={TU.D_TelprtTick=1}] at @s run playsound minecraft:block.portal.trigger voice @s ~ ~ ~ 100 1 1

execute as @a[scores={TU.D_TelprtTick=1..,TU.D_PosY=5..}] at @s unless entity @e[tag=TU.D_UnderneathPortal,distance=...8] run title @s actionbar {"text":"Teleport cancelled...","color":"dark_red"}
execute as @a[scores={TU.D_TelprtTick=1..,TU.D_PosY=5..}] at @s unless entity @e[tag=TU.D_UnderneathPortal,distance=...8] run scoreboard players set @s TU.D_TelprtTick 0
    #out
#run teleport checks
scoreboard players add @a[nbt={Dimension:0},scores={TU.D_PosY=..4,TU.D_Sneak=1..},gamemode=!spectator] TU.D_TelprtTick 1
execute as @a[scores={TU.D_TelprtTick=1..,TU.D_PosY=..4,TU.D_Sneak=0}] run title @s actionbar {"text":"Teleport cancelled...","color":"dark_red"}
execute as @a[scores={TU.D_TelprtTick=1..,TU.D_PosY=..4,TU.D_Sneak=0}] run scoreboard players set @s TU.D_TelprtTick 0
scoreboard players set @a[scores={TU.D_Sneak=1..}] TU.D_Sneak 0
    #visuals
execute as @a[scores={TU.D_TelprtTick=1..99}] run title @s actionbar [{"text":"Teleporting... ","color":"dark_blue"},{"score":{"objective":"TU.D_TelprtTickS","name":"@s"},"color":"blue"},{"text":"/5 seconds remaining","color":"dark_blue"}]
execute as @a[scores={TU.D_TelprtTick=100..}] at @s if entity @e[tag=TU.D_UnderneathPortal,distance=...8] run function underneath:dimension/teleport/in
execute as @a[scores={TU.D_TelprtTick=100..}] at @s run function underneath:dimension/teleport/out

execute at @e[tag=TU.D_UnderneathPortal] run particle minecraft:witch ~ ~ ~ .1 .5 .1 0 10 normal @a
#convert ticks into seconds
execute as @a run scoreboard players operation @s TU.D_TelprtTickS = @s TU.D_TelprtTick
execute as @a run scoreboard players operation @s TU.D_TelprtTickS /= TickSecond TU.Independent
#visuals
particle minecraft:witch 0 20 0 1.5 0 1.5 0 5 normal @a

#mobs
    #tag
tag @e[type=minecraft:zombie_villager,tag=!TU.D_ReplaceMob] add TU.D_ReplaceMob
tag @e[type=minecraft:skeleton] add TU.D_ReplaceMob
tag @e[type=minecraft:creeper] add TU.D_ReplaceMob
tag @e[type=minecraft:bat] add TU.D_ReplaceMob
tag @e[type=minecraft:spider] add TU.D_ReplaceMob
    #store scores
execute as @e[tag=TU.D_ReplaceMob,tag=!TU.D_ProcessedMob] store result score @s TU.D_PosY run data get entity @s Pos[1]
    #run checks
execute as @e[tag=TU.D_ReplaceMob,scores={TU.D_PosY=..39},tag=!TU.D_NoReplace,tag=!TU.D_ProcessedMob] at @s run function underneath:dimension/replace_mob
    #ensure no multiple checks
tag @e[tag=TU.D_ReplaceMob] add TU.D_ProcessedMob