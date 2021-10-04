# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

function 2mal3:check_server
function 2mal3:minecraft_version
execute unless score $MinecraftVersion 2mal3.Data matches 2584.. run tellraw @s [{"text":"[","color":"gray"},{"text":"nesu","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use a version later than 1.16.","color":"gold"}]
execute if score $Server.Modded 2mal3.Data matches 1 run tellraw @s [{"text":"[","color":"gray"},{"text":"nesu","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This server software is not supported by the datapack, so errors may occur. Please use another server software for better stability.","color":"gold"}]
execute store result score @s nesu.Schedule run schedule function nesu:core/__generated__/schedule/1 4s append