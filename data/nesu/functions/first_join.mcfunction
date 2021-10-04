# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=4..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Joined game","color":"aqua"}]
gamemode spectator @s
effect give @s minecraft:blindness 6 0 true
execute in minecraft:the_nether positioned ~ ~ ~ run tp @s ~ ~ ~
execute store result score @s nesu.Schedule run schedule function nesu:__generated__/schedule/0 5s append