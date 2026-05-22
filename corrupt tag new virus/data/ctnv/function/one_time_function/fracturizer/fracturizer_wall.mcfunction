# this is where the final area is made

#1 tp all runners
tp @a @s
tp @a[team=runners] ~ ~2 ~
#give him blindness and slowness so that the runners have a chance to get away
effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 4 true
tp @s ~ ~ ~ 0 90

# give runners full health just in case
execute as @a[team=runners] run scoreboard players set @s health 6

# summon wall
function ctnv:one_time_function/fracturizer/wall_summon

# immidatly kill all shulkers that are inside a wall to prevent lag and noise
execute as @e[type=shulker] at @s unless block ~ ~ ~ minecraft:air run kill @s

# set the corrupted ones corruption to 90% just in case they did it at like 95%
scoreboard players set @a[team=corrupted] corruption 90

# kill the spacemans teleport
kill @e[tag=rewind_shard]

# super ominous tile that tells everyone that the wall is up
title @a title [{"text":"The Wall Closes IN!","color":"red","bold":true,"italic":false}]