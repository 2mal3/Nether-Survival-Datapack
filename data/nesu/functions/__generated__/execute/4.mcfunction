# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"selector":"@s", "color": "green"},{"text":"]: ","color":"gray"},{"text":"Set new worldspawn","color":"green"}]
scoreboard players set %Spawn nesu.Data 1
summon minecraft:marker ~ ~ ~ {UUID: [I; 1322582132, 1552435490, -2058896060, 1907617580], Tags: ["global.ignore"]}
spreadplayers ~ ~ 1 64 under 127 true 4ed50074-5c88-4922-8547-bd4471b3ef2c