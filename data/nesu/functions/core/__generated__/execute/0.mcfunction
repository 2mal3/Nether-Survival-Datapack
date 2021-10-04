# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed","color":"green"}]
scoreboard players set %Installed nesu.Data 1
scoreboard objectives add nesu.Data dummy
scoreboard players set %Spawn nesu.Data 0
scoreboard players set $Version nesu.Data 010000
schedule function nesu:core/__generated__/schedule/0 4s replace