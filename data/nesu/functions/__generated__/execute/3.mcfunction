# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=4..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Set spawnpoint","color":"aqua"}]
execute if score %Spawn nesu.Data matches 0 run function nesu:__generated__/execute/4
tp @s 4ed50074-5c88-4922-8547-bd4471b3ef2c
gamemode survival @s
execute store result score @s nesu.Schedule run schedule function nesu:__generated__/schedule/1 10t append