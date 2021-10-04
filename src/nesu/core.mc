
function reload {
  # Output debug message
  tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack reloaded","color":"green"}]

  scoreboard objectives add nesu.Data dummy
  scoreboard objectives add nesu.Schedule dummy

  # Initializes the datapack at the first startup or new version
  execute unless score %Installed nesu.Data matches 1 run {
    # Output debug message in chat
    tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed","color":"green"}]
    
    scoreboard players set %Installed nesu.Data 1

    scoreboard objectives add nesu.Data dummy
    scoreboard players set %Spawn nesu.Data 0

    # Set the version in format: xx.xx.xx
    scoreboard players set $Version nesu.Data 010000

    schedule 4s replace {
      tellraw @a [{"text":"Nether Survival v1.0.0 by 2mal3 was installed!","color":"blue"}]
    }
  }
  execute if score %Installed nesu.Data matches 1 unless score $Version nesu.Data matches 010000 run {
    # Output debug message
    tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Updated datapack","color":"green"}]
    # Save new version
    scoreboard players set $Version nola.Data 010000
  }

  # Saves that the datapack was started
  scoreboard players set Nether-Survival load.status 1
}

advancement first_join 
{
  "criteria": {
    "requirement": {
      "trigger": "minecraft:tick"
    }
  },
  "rewards": {
    "function": "nesu:core/first_join"
  }
}

function first_join {
  # Gives ther player a unique id
  # function 2mal3:uuid

  ## Warns the player if he uses a not supportet server software or minecraft version
  # Get data
  function 2mal3:check_server
  function 2mal3:minecraft_version

  # Gives an error message for wrong versions
  execute unless score $MinecraftVersion 2mal3.Data matches 2584.. run tellraw @s [{"text":"[","color":"gray"},{"text":"nesu","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use a version later than 1.16.","color":"gold"}]
  execute if score $Server.Modded 2mal3.Data matches 1 run tellraw @s [{"text":"[","color":"gray"},{"text":"nesu","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This server software is not supported by the datapack, so errors may occur. Please use another server software for better stability.","color":"gold"}]
  
  # Datapack stuff
  execute store result score @s nesu.Schedule run schedule 4s append {
      execute store result score .Temp0 nesu.Data run time query gametime
      execute as @a if score @s nesu.Schedule = .Temp0 nesu.Data at @s run function nesu:first_join
  }
}

function uninstall {
  # Output debug message
  tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack uninstalled","color":"green"}]

  # Deletes the scoreboards
  scoreboard objectives remove nesu.Data
  scoreboard objectives remove nesu.Schedule

  # Sends an uninstallation message to all players
  tellraw @a [{"text":"Nether Survival v1.0.0 by 2mal3 was successfully uninstalled."}]

  # Disables the datapack
  datapack disable "file/Nether-Survival-v1.0.0"
  datapack disable "file/Nether-Survival-v1.0.0.zip"
}
