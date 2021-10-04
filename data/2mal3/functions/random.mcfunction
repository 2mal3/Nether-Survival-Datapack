# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

summon minecraft:marker ~ ~ ~ {Tags: ["2mal3.random"]}
execute store result score .Temp0 2mal3.Data run data get entity @e[type=minecraft:marker,tag=2mal3.random,limit=1] UUID[0]
scoreboard players operation .Temp1 2mal3.Data = .In1 2mal3.Data
scoreboard players add .Temp1 2mal3.Data 1
scoreboard players operation .Temp1 2mal3.Data -= .In0 2mal3.Data
scoreboard players operation .Temp0 2mal3.Data %= .Temp1 2mal3.Data
scoreboard players operation .Temp0 2mal3.Data += .In0 2mal3.Data
scoreboard players operation .Out0 2mal3.Data = .Temp0 2mal3.Data
kill @e[type=minecraft:marker,tag=2mal3.random]