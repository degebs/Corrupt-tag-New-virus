clear @s barrier

scoreboard players add @s player_swap_cooldown 0

# do the detection for the swap
execute if score @s player_swap_detect matches 1 run scoreboard players set @s player_swap_cooldown 1981
execute if score @s player_swap_detect matches 1 run clear @s music_disc_lava_chicken
execute if score @s player_swap_detect matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:music_disc_lava_chicken"}}]

#==============================================================================================================================================================
# the swap itself
#===============================================================================================================================================================

# Tag the swapping player and the farthest runner
execute if score @s player_swap_detect matches 1 run tag @s add swap_self
execute if score @s player_swap_detect matches 1 at @s run tag @a[team=runners,limit=1,sort=furthest] add swap_target

# Remove swap_target from the self player if they somehow got it (should not happen, but safe)
# if the game tries to teleport them to themselves dont
execute if score @s player_swap_detect matches 1 as @a[tag=swap_self,tag=swap_target] at @s run tag @a[team=runners,limit=1,sort=furthest] add swap_target

# make sure that the player cannot teleport to themselves
execute if score @s player_swap_detect matches 1 run tag @a[tag=swap_self,tag=swap_target] remove swap_target

# --- AUDIO & VISUAL EFFECTS (pre‑swap) ---
# Play enderman teleport sound at both players
execute if score @s player_swap_detect matches 1 as @a[tag=swap_self] at @s run playsound minecraft:entity.enderman.teleport master @a[distance=0..30] ~ ~ ~ 1 0.8
execute if score @s player_swap_detect matches 1 as @a[tag=swap_target] at @s run playsound minecraft:entity.enderman.teleport master @a[distance=0..30] ~ ~ ~ 1 0.8

# Spawn portal particles at both players' original positions
execute if score @s player_swap_detect matches 1 as @a[tag=swap_self] at @s run particle minecraft:portal ~ ~0.5 ~ 0.5 1 0.5 0.5 150
execute if score @s player_swap_detect matches 1 as @a[tag=swap_target] at @s run particle minecraft:portal ~ ~0.5 ~ 0.5 1 0.5 0.5 150

# --- FANCY ANNOUNCEMENT (colorful JSON) ---
# Build the tellraw with player names and colors
execute if score @s player_swap_detect matches 1 run tellraw @a [{"text":"⚡ ","color":"gold","bold":true},{"text":"SWAP","color":"light_purple","bold":true},{"text":" ⚡ ","color":"gold","bold":true},{"text":"\n","color":"yellow"},{"selector":"@a[tag=swap_self,limit=1]","color":"green"},{"text":" swapped places with ","color":"white"},{"selector":"@a[tag=swap_target,limit=1]","color":"yellow"},{"text":" !","color":"white"}]

# Summon a marker at the self player's original position
execute if score @s player_swap_detect matches 1 at @s run summon marker ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Tags:["swap_marker"]}

# Teleport the self player to the target player's position
execute if score @s player_swap_detect matches 1 as @a[tag=swap_self,limit=1] at @s run tp @s @a[tag=swap_target,limit=1]

# Teleport the target player to the marker (original self position)
execute if score @s player_swap_detect matches 1 as @a[tag=swap_target,limit=1] at @s run tp @s @e[tag=swap_marker,limit=1]

# --- EFFECTS AFTER TELEPORT (destination) ---
# Spawn end rod and reverse portal particles at the new positions (using marker locations)
execute if score @s player_swap_detect matches 1 at @e[tag=swap_marker,limit=1] run particle minecraft:end_rod ~ ~0.5 ~ 0.3 0.5 0.3 0.1 60
execute if score @s player_swap_detect matches 1 at @e[tag=swap_marker,limit=1] run particle minecraft:reverse_portal ~ ~0.5 ~ 0.3 0.5 0.3 0.1 60

# Play a satisfying teleport sound for the swapping player (and optionally all)
execute if score @s player_swap_detect matches 1 as @s run playsound minecraft:entity.player.teleport master @a[distance=0..30] ~ ~ ~ 0.6 1.2

# (Optional) Face each other after swap – uncomment if desired
# execute if score @s player_swap_detect matches 1 as @a[tag=swap_self] at @s run tp @s ~ ~ ~ facing entity @a[tag=swap_target,limit=1]
# execute if score @s player_swap_detect matches 1 as @a[tag=swap_target] at @s run tp @s ~ ~ ~ facing entity @a[tag=swap_self,limit=1]

# for your greed you shall be set to 1 heart
execute if score @s player_swap_detect matches 1 run scoreboard players set @a[tag=swap_self] health 1

# Clean up tags and marker
execute if score @s player_swap_detect matches 1 run tag @e[tag=swap_self] remove swap_self
execute if score @s player_swap_detect matches 1 run tag @e[tag=swap_target] remove swap_target
execute if score @s player_swap_detect matches 1 run kill @e[tag=swap_marker]

# Set detect back to 0 (so it doesn't repeat)
execute if score @s player_swap_detect matches 1 run scoreboard players set @s player_swap_detect 0
#==============================================================================================================================================================
# end of swap logic
#===============================================================================================================================================================
execute if score @s player_swap_detect matches 1 run scoreboard players set @s player_swap_detect 0

# set the cooldown to 99 seconds
execute if score @s player_swap_cooldown matches 1.. run scoreboard players remove @s player_swap_cooldown 1

# if cooldown is o put the item in the 3rd slot
execute as @s at @s if score @s player_swap_cooldown matches 0 unless entity @a[team=runners,distance=0.1..3] run item replace entity @s hotbar.2 with music_disc_lava_chicken[item_name=[{"text":"Runner swap!","color":"green","italic":false}]]
execute as @s at @s if score @s player_swap_cooldown matches 0 if entity @a[team=runners,distance=0.1..3] run item replace entity @s hotbar.2 with barrier[item_name=[{"text":"Too close to swap!","color":"red","italic":false}]]

# the actuall cooldown for 99 seconds

# cooldown timer with gray dye
execute if score @s player_swap_cooldown matches 1980 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 99
execute if score @s player_swap_cooldown matches 1960 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 98
execute if score @s player_swap_cooldown matches 1940 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 97
execute if score @s player_swap_cooldown matches 1920 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 96
execute if score @s player_swap_cooldown matches 1900 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 95
execute if score @s player_swap_cooldown matches 1880 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 94
execute if score @s player_swap_cooldown matches 1860 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 93
execute if score @s player_swap_cooldown matches 1840 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 92
execute if score @s player_swap_cooldown matches 1820 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 91
execute if score @s player_swap_cooldown matches 1800 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 90
execute if score @s player_swap_cooldown matches 1780 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 89
execute if score @s player_swap_cooldown matches 1760 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 88
execute if score @s player_swap_cooldown matches 1740 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 87
execute if score @s player_swap_cooldown matches 1720 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 86
execute if score @s player_swap_cooldown matches 1700 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 85
execute if score @s player_swap_cooldown matches 1680 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 84
execute if score @s player_swap_cooldown matches 1660 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 83
execute if score @s player_swap_cooldown matches 1640 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 82
execute if score @s player_swap_cooldown matches 1620 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 81
execute if score @s player_swap_cooldown matches 1600 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 80
execute if score @s player_swap_cooldown matches 1580 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 79
execute if score @s player_swap_cooldown matches 1560 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 78
execute if score @s player_swap_cooldown matches 1540 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 77
execute if score @s player_swap_cooldown matches 1520 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 76
execute if score @s player_swap_cooldown matches 1500 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 75
execute if score @s player_swap_cooldown matches 1480 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 74
execute if score @s player_swap_cooldown matches 1460 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 73
execute if score @s player_swap_cooldown matches 1440 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 72
execute if score @s player_swap_cooldown matches 1420 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 71
execute if score @s player_swap_cooldown matches 1400 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 70
execute if score @s player_swap_cooldown matches 1380 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 69
execute if score @s player_swap_cooldown matches 1360 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 68
execute if score @s player_swap_cooldown matches 1340 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 67
execute if score @s player_swap_cooldown matches 1320 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 66
execute if score @s player_swap_cooldown matches 1300 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 65
execute if score @s player_swap_cooldown matches 1280 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 64
execute if score @s player_swap_cooldown matches 1260 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 63
execute if score @s player_swap_cooldown matches 1240 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 62
execute if score @s player_swap_cooldown matches 1220 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 61
execute if score @s player_swap_cooldown matches 1200 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 60
execute if score @s player_swap_cooldown matches 1180 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 59
execute if score @s player_swap_cooldown matches 1160 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 58
execute if score @s player_swap_cooldown matches 1140 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 57
execute if score @s player_swap_cooldown matches 1120 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 56
execute if score @s player_swap_cooldown matches 1100 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 55
execute if score @s player_swap_cooldown matches 1080 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 54
execute if score @s player_swap_cooldown matches 1060 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 53
execute if score @s player_swap_cooldown matches 1040 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 52
execute if score @s player_swap_cooldown matches 1020 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 51
execute if score @s player_swap_cooldown matches 1000 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 50
execute if score @s player_swap_cooldown matches 980 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 49
execute if score @s player_swap_cooldown matches 960 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 48
execute if score @s player_swap_cooldown matches 940 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 47
execute if score @s player_swap_cooldown matches 920 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 46
execute if score @s player_swap_cooldown matches 900 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 45
execute if score @s player_swap_cooldown matches 880 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 44
execute if score @s player_swap_cooldown matches 860 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 43
execute if score @s player_swap_cooldown matches 840 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 42
execute if score @s player_swap_cooldown matches 820 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 41
execute if score @s player_swap_cooldown matches 800 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 40
execute if score @s player_swap_cooldown matches 780 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 39
execute if score @s player_swap_cooldown matches 760 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 38
execute if score @s player_swap_cooldown matches 740 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 37
execute if score @s player_swap_cooldown matches 720 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 36
execute if score @s player_swap_cooldown matches 700 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 35
execute if score @s player_swap_cooldown matches 680 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 34
execute if score @s player_swap_cooldown matches 660 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 33
execute if score @s player_swap_cooldown matches 640 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 32
execute if score @s player_swap_cooldown matches 620 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 31
execute if score @s player_swap_cooldown matches 600 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 30
execute if score @s player_swap_cooldown matches 580 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 29
execute if score @s player_swap_cooldown matches 560 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 28
execute if score @s player_swap_cooldown matches 540 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 27
execute if score @s player_swap_cooldown matches 520 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 26
execute if score @s player_swap_cooldown matches 500 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 25
execute if score @s player_swap_cooldown matches 480 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 24
execute if score @s player_swap_cooldown matches 460 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 23
execute if score @s player_swap_cooldown matches 440 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 22
execute if score @s player_swap_cooldown matches 420 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 21
execute if score @s player_swap_cooldown matches 400 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 20
execute if score @s player_swap_cooldown matches 380 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 19
execute if score @s player_swap_cooldown matches 360 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 18
execute if score @s player_swap_cooldown matches 340 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 17
execute if score @s player_swap_cooldown matches 320 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 16
execute if score @s player_swap_cooldown matches 300 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 15
execute if score @s player_swap_cooldown matches 280 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 14
execute if score @s player_swap_cooldown matches 260 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 13
execute if score @s player_swap_cooldown matches 240 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 12
execute if score @s player_swap_cooldown matches 220 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 11
execute if score @s player_swap_cooldown matches 200 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 10
execute if score @s player_swap_cooldown matches 180 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 9
execute if score @s player_swap_cooldown matches 160 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 8
execute if score @s player_swap_cooldown matches 140 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 7
execute if score @s player_swap_cooldown matches 120 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 6
execute if score @s player_swap_cooldown matches 100 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 5
execute if score @s player_swap_cooldown matches 80 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 4
execute if score @s player_swap_cooldown matches 60 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 3
execute if score @s player_swap_cooldown matches 40 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 2
execute if score @s player_swap_cooldown matches 20 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"cooldown","italic":false}],max_stack_size=99] 1

