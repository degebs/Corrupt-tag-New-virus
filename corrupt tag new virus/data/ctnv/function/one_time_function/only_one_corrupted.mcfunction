# here we finally fix the glitch where there can be multiple corrupted

#first we make everyone a runner
scoreboard players operation @a health = setting ST____max_health
team join runners @a
# reset all attributes
execute as @a run attribute @s movement_speed base reset
execute as @a run attribute @s jump_strength base reset
effect clear @a

# make the corruption part tag the nearest player as "last known corrupted"
execute as @e[tag=corruption_part] at @s run tag @a[team=runners,sort=nearest,limit=1] add last_known_corrupted
tag @a add potentially_corrupted
# then re remove the "potentially corrupted" with the "last known corrupted" tag, so only the nearest player to the corruption part is left with the "potentially corrupted" tag
tag @a[tag=last_known_corrupted] remove potentially_corrupted
# then we remove the "last known corrupted" tag so it can be used again
tag @a remove last_known_corrupted

# then we take the corruption part, and find the nearest player
execute as @e[tag=corruption_part] at @s run tp @s @a[team=runners,sort=nearest,limit=1]

execute as @e[tag=corruption_part] at @s run scoreboard players set @a[team=runners,sort=nearest,limit=1,tag=potentially_corrupted] health 0
# teleport the corruption part to the nearest player

# use a tellraw command to tell if this function triggered
tag @a remove potentially_corrupted
tellraw @a [{"text":"WARNING: multiple corrupted players detected. fixing!","color":"gold"}]

