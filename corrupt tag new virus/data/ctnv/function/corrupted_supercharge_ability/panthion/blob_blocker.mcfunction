#========================================================================================================================================================================================
# if a runner stands within the blob, it will count up a timer
execute as @a[team=!corrupted] at @s if entity @e[tag=blob,distance=..3,type=block_display] run scoreboard players add blob_kill corrupted_supercharge 1

execute as @a[team=!corrupted] at @s if entity @e[tag=blob,distance=..3,type=block_display] run particle minecraft:crit ~ ~1 ~ 0.5 0.5 0.5 0.1 5 force @s

execute as @a[team=!corrupted] at @s if entity @e[tag=blob,distance=..3,type=block_display] if score tick time matches 1 run playsound entity.phantom.ambient hostile @s ~ ~ ~ 1 1 1
execute as @a[team=!corrupted] at @s if entity @e[tag=blob,distance=..3,type=block_display] run playsound block.fire.extinguish hostile @s ~ ~ ~ 0.3 2 0.3
#========================================================================================================================
# if the timer reaches 1000 ( 50 seconds) then the blob will be destroyed
execute if score blob_kill corrupted_supercharge matches 1000.. at @e[tag=blob] run particle explosion_emitter ~ ~1 ~ 0.5 0.5 0.5 0.1 50 force @a
execute if score blob_kill corrupted_supercharge matches 1000.. at @e[tag=blob] run playsound entity.generic.explode hostile @a ~ ~ ~ 1 1 1
execute if score blob_kill corrupted_supercharge matches 1000.. at @e[tag=blob] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 1 0.1 1
execute if score blob_kill corrupted_supercharge matches 1000.. at @e[tag=blob] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 1 2 1

execute if score blob_kill corrupted_supercharge matches 1000.. as @e[tag=blob] run kill @e[type=bat]

execute if score blob_kill corrupted_supercharge matches 1000.. as @e[tag=blob] run kill @s
# when the blob is killed,
execute if score blob_kill corrupted_supercharge matches 1000.. as @e[tag=blob] run kill @s
# code stolen from the hive mind
#========================================================================================================================================================================================
# particles to show the blob is active
execute as @e[tag=blob,type=item_display] at @s run particle minecraft:dust{color:[1,0,1],scale:1} ~ ~ ~ 0.5 3 0.5 0.1 1 normal @a
execute as @e[tag=blob] at @s if score 360 time matches 10 run playsound block.lava.ambient hostile @a ~ ~ ~ 0.1 0.1 0.1

#========================================================================================================================================================================================
# if a corrupted player is within its radius it will prevent corruption increase by halting the corruption tick
execute as @a[team=corrupted] at @s if entity @e[tag=blob,distance=..3,type=block_display] run scoreboard players set corruption_tick corruption 0

execute as @a[team=corrupted] at @s if entity @e[tag=blob,distance=..3,type=block_display] if score tick time matches 1 run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 1 force @s