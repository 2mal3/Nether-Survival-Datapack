# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

tag @s remove 2mal3.Moving
scoreboard players operation .Temp0 2mal3.Data = @s 2mal3.pos.x
scoreboard players operation .Temp1 2mal3.Data = @s 2mal3.pos.y
scoreboard players operation .Temp2 2mal3.Data = @s 2mal3.pos.z
execute store result score @s 2mal3.pos.x run data get entity @s Pos[0] 1
execute store result score @s 2mal3.pos.y run data get entity @s Pos[1] 1
execute store result score @s 2mal3.pos.z run data get entity @s Pos[2] 1
execute unless score .Temp0 2mal3.Data = @s 2mal3.pos.x run tag @s add 2mal3.Moving
execute unless score .Temp1 2mal3.Data = @s 2mal3.pos.y run tag @s add 2mal3.Moving
execute unless score .Temp2 2mal3.Data = @s 2mal3.pos.z run tag @s add 2mal3.Moving