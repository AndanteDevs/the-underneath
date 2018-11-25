#@s - console
#called by #minecraft:tick

#check for fill layer
execute as @a at @s in minecraft:overworld if block ~ 0 ~ minecraft:bedrock run function underneath:world_generation/fill_layer
execute as @a at @s in minecraft:overworld unless block ~ 40 ~ minecraft:bedrock run function underneath:world_generation/fill_layer