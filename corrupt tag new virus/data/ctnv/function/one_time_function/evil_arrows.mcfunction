
execute as @e[type=arrow,tag=EVIL] at @s run particle minecraft:flame ~ ~ ~ 0 0 0 0.1 3 force @a

execute if score @p corruption matches 15.. run execute as @e[type=arrow,tag=EVIL] at @s run particle minecraft:reverse_portal ~ ~ ~ 0.5 0.5 0.5 0.1 3 normal @a

execute if score @p corruption matches 50.. run execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=300..}] at @s run particle minecraft:poof ~ ~ ~ 0 0 0 0.1 2 normal @a



#==================================================================================================================================
# keep track of evil arrows
execute as @e[type=arrow,tag=EVIL] run scoreboard players add @s EVIL_arrow_time 1

#---------------------------------------------------------------------
# kill evil arrows if a player gets too close (cant have them getting picked up now)
execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=10..},nbt={inGround:1b}] at @s if entity @a[distance=..3] run particle dripping_dripstone_lava ~ ~ ~ 0.2 0 0.2 0.2 125 normal @a

# if the corruption is 15% or more give the runner who ran by it glowing
execute if score @p corruption matches 15.. run execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=10..},nbt={inGround:1b}] at @s if entity @a[distance=..3] run particle large_smoke ~ ~ ~ 0.2 0 0.2 0.2 25 normal @a
execute if score @p corruption matches 15.. run execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=10..},nbt={inGround:1b}] at @s if entity @a[distance=..3,team=runners] run effect give @p glowing 5 1
execute if score @p corruption matches 15.. run execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=10..},nbt={inGround:1b}] at @s if entity @a[distance=..3,team=runners] run playsound block.beacon.deactivate block @a ~ ~ ~ 1 1 0.5

# if the corruption is 50% or more damage the nearest runner but only after some time
execute if score @p corruption matches 50.. run execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=300..}] at @s if entity @a[distance=..3] run particle dragon_breath ~ ~ ~ 0.2 0 0.2 0.2 25 normal @a
execute if score @p corruption matches 50.. run execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=300..}] at @s if entity @a[distance=..3,team=runners] run scoreboard players remove @p health 1
execute if score @p corruption matches 50.. run execute as @e[type=arrow,tag=EVIL,scores={EVIL_arrow_time=300..}] at @s if entity @a[distance=..3,team=runners] run playsound entity.wither.hurt block @a ~ ~ ~ 1 1 0.5


execute as @e[type=arrow,tag=EVIL,nbt={inGround:1b}] at @s if entity @a[distance=..3] run kill @s
#---------------------------------------------------------------------

# make sure they cant kill
data merge entity @e[type=arrow,limit=1,sort=random,tag=EVIL] {damage:1.0}