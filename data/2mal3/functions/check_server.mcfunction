# Datapack by 2mal3 (https://github.com/2mal3)
# Built using mc-build (https://github.com/mc-build/mc-build) 

scoreboard players set $Server.Modded 2mal3.Data 0
scoreboard players set $Server.Bukkit 2mal3.Data 0
scoreboard players set $Server.Spigot 2mal3.Data 0
scoreboard players set $Server.Paper 2mal3.Data 0
execute store success score $Server.Bukkit 2mal3.Data run data get entity @r "Bukkit.updateLevel"
execute store success score $Server.Spigot 2mal3.Data run data get entity @r "Spigot.ticksLived"
execute store success score $Server.Paper 2mal3.Data run data get entity @r "Paper.SpawnReason"
execute if score $Server.Bukkit 2mal3.Data matches 1 run scoreboard players set $Server.Modded 2mal3.Data 1
execute if score $Server.Spigot 2mal3.Data matches 1 run scoreboard players set $Server.Modded 2mal3.Data 1
execute if score $Server.Paper 2mal3.Data matches 1 run scoreboard players set $Server.Modded 2mal3.Data 1