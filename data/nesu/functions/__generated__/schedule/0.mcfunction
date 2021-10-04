# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

execute store result score .Temp0 nesu.Data run time query gametime
execute as @a if score @s nesu.Schedule = .Temp0 nesu.Data at @s run function nesu:__generated__/execute/3