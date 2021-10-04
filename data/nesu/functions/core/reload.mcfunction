# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack reloaded","color":"green"}]
scoreboard objectives add nesu.Data dummy
scoreboard objectives add nesu.Schedule dummy
execute unless score %Installed nesu.Data matches 1 run function nesu:core/__generated__/execute/0
execute if score %Installed nesu.Data matches 1 unless score $Version nesu.Data matches 010000 run function nesu:core/__generated__/execute/1
scoreboard players set Nether-Survival load.status 1