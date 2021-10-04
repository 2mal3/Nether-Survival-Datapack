# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack uninstalled","color":"green"}]
scoreboard objectives remove nesu.Data
scoreboard objectives remove nesu.Schedule
tellraw @a [{"text":"Nether Survival v1.0.0 by 2mal3 was successfully uninstalled."}]
datapack disable "file/Nether-Survival-v1.0.0"
datapack disable "file/Nether-Survival-v1.0.0.zip"