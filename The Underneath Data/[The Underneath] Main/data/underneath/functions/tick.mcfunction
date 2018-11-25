#@s - console
#called by #minecraft:tick

#check for players in-game who had left the game
tag @a[scores={TU.JN_LeaveGame=1..},tag=TU.JN_Joined] remove TU.JN_Joined
#run joined player functions
execute as @a[tag=!TU.JN_Joined,gamemode=!spectator] at @s run function underneath:join_notifications/join/normal
execute as @a[tag=!TU.JN_Joined,gamemode=spectator] at @s run function underneath:join_notifications/join/spectator
#clock
scoreboard players add Clock TU.Tick 1
execute if score Clock TU.Tick matches 16.. run function #underneath:clock