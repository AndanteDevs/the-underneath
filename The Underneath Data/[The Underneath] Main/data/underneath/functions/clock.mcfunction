#@s - console
#called by #underneath:clock

#give root advancements
advancement grant @a only minecraft:story/root
advancement grant @a only minecraft:nether/root
advancement grant @a only minecraft:end/root
advancement grant @a only minecraft:adventure/root
advancement grant @a only minecraft:husbandry/root
#reset score
scoreboard players set Clock TU.Tick 0
#set world spawn
setworldspawn 0 0 0