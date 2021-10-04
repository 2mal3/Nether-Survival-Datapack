function reload {
  # Add scoreboards
  scoreboard objectives add 2mal3.Data dummy
  scoreboard objectives add 2mal3.DebugMode dummy
  scoreboard objectives add 2mal3.pos.x dummy
  scoreboard objectives add 2mal3.pos.y dummy
  scoreboard objectives add 2mal3.pos.z dummy
  scoreboard objectives add 2mal3.Uuid dummy

  # Saves that the datapack was started
  scoreboard players set 2mal3 load.status 1
  # Set version in format xx.xx.xx
  scoreboard players set $Version 2mal3.Data 010000
}


function uninstall {
  # Remove scoreboards
  scoreboard objectives remove 2mal3.Data
  scoreboard objectives remove 2mal3.DebugMode
  scoreboard objectives remove 2mal3.pos.x
  scoreboard objectives remove 2mal3.pos.y
  scoreboard objectives remove 2mal3.pos.z
  scoreboard objectives remove 2mal3.Uuid
}


function random {
  # Prepare
  summon minecraft:marker ~ ~ ~ {Tags: ["2mal3.random"]}


  # Generate random number
  execute store result score .Temp0 2mal3.Data run data get entity @e[type=minecraft:marker,tag=2mal3.random,limit=1] UUID[0]

  scoreboard players operation .Temp1 2mal3.Data = .In1 2mal3.Data
  scoreboard players add .Temp1 2mal3.Data 1
  scoreboard players operation .Temp1 2mal3.Data -= .In0 2mal3.Data

  scoreboard players operation .Temp0 2mal3.Data %= .Temp1 2mal3.Data
  scoreboard players operation .Temp0 2mal3.Data += .In0 2mal3.Data

  scoreboard players operation .Out0 2mal3.Data = .Temp0 2mal3.Data


  # Remove the marker
  kill @e[type=minecraft:marker,tag=2mal3.random]
}


function minecraft_version {
  execute store result score $MinecraftVersion 2mal3.Data run data get entity @s DataVersion
}


function get_moving {
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
} 


function check_server {
  # Prepare variables
  scoreboard players set $Server.Modded 2mal3.Data 0
  scoreboard players set $Server.Bukkit 2mal3.Data 0
  scoreboard players set $Server.Spigot 2mal3.Data 0
  scoreboard players set $Server.Paper 2mal3.Data 0

  # Checks for specific Server software
  execute store success score $Server.Bukkit 2mal3.Data run data get entity @r "Bukkit.updateLevel"
  execute store success score $Server.Spigot 2mal3.Data run data get entity @r "Spigot.ticksLived"
  execute store success score $Server.Paper 2mal3.Data run data get entity @r "Paper.SpawnReason"

  # Generell variables
  execute if score $Server.Bukkit 2mal3.Data matches 1 run scoreboard players set $Server.Modded 2mal3.Data 1
  execute if score $Server.Spigot 2mal3.Data matches 1 run scoreboard players set $Server.Modded 2mal3.Data 1
  execute if score $Server.Paper 2mal3.Data matches 1 run scoreboard players set $Server.Modded 2mal3.Data 1
}


function uuid {
  scoreboard players add %id 2mal3.Data 1
  scoreboard players operation @s 2mal3.Uuid = %id 2mal3.Data
}
