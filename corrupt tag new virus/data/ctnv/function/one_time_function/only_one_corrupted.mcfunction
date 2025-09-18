# here we finally fix the glitch where there can be multiple corrupted

#first we make everyone a runner
scoreboard players operation @a health = setting ST____max_health
team join runners @a
# reset all attributes
execute as @a run attribute @s movement_speed base reset
execute as @a run attribute @s jump_strength base reset



# then we take the corruption part, and find the nearest player

execute as @e[tag=corruption_part] at @e[tag=corruption_part] run scoreboard players set @a[team=runners,sort=nearest,limit=1] health 0
# teleport the corruption part to the nearest player
execute as @e[tag=corruption_part] at @e[tag=corruption_part] run tp @s @a[team=runners,sort=nearest,limit=1]

# use a tellraw command to tell if this function triggered
tellraw @a [{"text":"WARNING: multiple corrupted players detected. fixing!","color":"gold"}]

