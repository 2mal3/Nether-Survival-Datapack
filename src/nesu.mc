
advancement nesu {
    "display": {
        "title": "Nether Survival v1.0.0",
        "description": "Start the game from the nether",
        "icon": {
            "item": "minecraft:netherrack"
        },
        "announce_to_chat": false,
        "show_toast": false
    },
    "parent": "global:2mal3",
    "criteria": {
        "trigger": {
            "trigger": "minecraft:tick"
        }
    }
}


function first_join {
  tellraw @a[scores={2mal3.DebugMode=4..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Joined game","color":"aqua"}]

  gamemode spectator @s
  effect give @s minecraft:blindness 6 0 true
  execute in minecraft:the_nether positioned ~ ~ ~ run tp @s ~ ~ ~

  execute store result score @s nesu.Schedule run schedule 5s append {
    execute store result score .Temp0 nesu.Data run time query gametime
    execute as @a if score @s nesu.Schedule = .Temp0 nesu.Data at @s run {
      tellraw @a[scores={2mal3.DebugMode=4..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Set spawnpoint","color":"aqua"}]

      # Chooses a new world spawnpoint in the nether if no one was set before
      execute if score %Spawn nesu.Data matches 0 run {
        tellraw @a[scores={2mal3.DebugMode=3..}] [{"text":"[","color":"gray"},{"text":"NeSu","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"selector":"@s", "color": "green"},{"text":"]: ","color":"gray"},{"text":"Set new worldspawn","color":"green"}]
        scoreboard players set %Spawn nesu.Data 1

        # Chooses a random position in the nether as the new worldspawn
        # The spawn is never in lava, fire or on the nether surface
        summon minecraft:marker ~ ~ ~ {UUID: [I; 1322582132, 1552435490, -2058896060, 1907617580], Tags: ["global.ignore"]}
        spreadplayers ~ ~ 1 64 under 127 true 4ed50074-5c88-4922-8547-bd4471b3ef2c
      }

      # Set the personal spawnpoint to the worldspawnpoint
      tp @s 4ed50074-5c88-4922-8547-bd4471b3ef2c
      gamemode survival @s
      execute store result score @s nesu.Schedule run schedule 10t append {
        execute store result score .Temp0 nesu.Data run time query gametime
        execute as @a if score @s nesu.Schedule = .Temp0 nesu.Data at @s run {
          spawnpoint @s ~ ~ ~
        }
      }
    }
  }
}
