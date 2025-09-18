#here the movement of the attack fish will be manully keyframed here

# loop ultil the fish is gone
#execute as @e[tag=fish_attack_] at @s if score @s fish_assist matches 0..80 run function ctnv:one_time_function/fish_attack_keyframe
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 0..100 run scoreboard players add @s fish_assist 1


# kill the fish attack when the animation is done
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 100.. run kill @s


#==============================================================================================================================
# animation time
#==============================================================================================================================

# basically the fish will move up with smooth interponation for the first 40 frames
# then it will move down with smooth interponation for the next 40 frames
# the fish will move up 5 blocks and down 5 blocks

# the fish will also rotate a bit while moving up and down

execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 0..49 run tp @s ~ ~0.125 ~ ~1 ~
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 50..99 run tp @s ~ ~-0.125 ~ ~2 ~


execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 0..6 run particle dust{color:[0.3,0.48,1.0],scale:4} ~ ~ ~ 2 0 2 1 60 normal @a
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 0..20 run particle dust{color:[0.3,0.48,1.0],scale:1} ~ ~ ~ 0.1 0.3 0.1 2 60 normal @a
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 98 run particle dust{color:[0.3,0.48,1.0],scale:4} ~ ~ ~ 1 1 1 1 60 normal @a


#==============================================================================================================================
# damage time
#==============================================================================================================================
# the fish will do damage when it burst out of the ground
execute at @e[tag=fish_attack] if score @s fish_assist matches 0..6 run effect give @e[distance=..6,team=corrupted] slowness 6 3 true
execute at @e[tag=fish_attack] if score @s fish_assist matches 0..6 run effect give @e[distance=..6,team=corrupted] blindness 4 3 true

#execute at @e[tag=fish_attack] if score @s fish_assist matches 0..6 run effect give @e[distance=..4,team=runners] slowness 1 1 true
execute at @e[tag=fish_attack] if score @s fish_assist matches 0..6 run effect give @e[distance=..4,team=runners] blindness 1 1 true

execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 0..6 run playsound entity.dolphin.attack player @a ~ ~ ~ 1 1 0.5
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 1 run playsound entity.generic.explode player @a ~ ~ ~ 1 1 0.5
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 0..49 run playsound block.water.ambient player @a ~ ~ ~ 1 1 0.5
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 89 run playsound entity.dolphin.ambient player @a ~ ~ ~ 1 1 0.5
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 99 run playsound entity.dolphin.play player @a ~ ~ ~ 1 1 0.5

# a little bit of trolling
# launch 51 snowballs in random directions

# Launch 51 windminecraft:snowballs in less predictable directions, each with the tag "splash"
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.37,1.5,-0.21]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.42,1.5,0.19]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.15,1.0,0.44]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.33,1.0,-0.37]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.29,1.0,-0.53]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.51,1.0,0.31]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.62,1.0,0.18]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.24,1.0,-0.61]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.48,1.0,0.56]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.59,1.0,-0.41]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.73,1.0,-0.12]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.13,1.0,0.77]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.66,1.0,-0.68]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.77,1.0,0.62]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.85,1.0,0.34]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.15,0.3,0.44]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.33,0.3,-0.37]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.29,0.3,-0.33]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.31,0.3,0.31]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.62,0.3,0.18]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.24,0.3,-0.61]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.48,0.3,0.36]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.39,0.3,-0.41]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.73,0.3,-0.12]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.13,0.3,0.77]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.66,0.3,-0.68]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.77,0.3,0.62]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.85,0.3,0.34]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.36,0.3,-0.84]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.92,0.3,-0.49]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.37,0.3,0.91]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.11,0.3,-0.97]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.98,0.3,0.39]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.21,0.3,0.99]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.99,0.3,-0.22]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.34,0.3,0.83]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.81,0.3,-0.35]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.77,0.3,0.68]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.69,0.3,-0.79]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.34,0.3,0.92]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.93,0.3,-0.35]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.61,0.3,0.73]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.75,0.3,-0.61]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.89,0.3,0.37]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.38,0.3,-0.88]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.42,0.3,0.81]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.82,0.3,-0.43]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.73,0.3,0.41]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.41,0.3,-0.73]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.42,1.0,0.81]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.82,1.0,-0.43]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.73,1.0,0.41]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.41,1.0,-0.73]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.37,0.5,-0.21]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.42,0.5,0.19]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.62,0.5,0.18]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.24,0.5,-0.61]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.48,0.5,0.56]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.59,0.5,-0.41]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.73,0.5,-0.12]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.13,0.5,0.77]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.66,0.5,-0.68]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.77,0.5,0.62]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.85,0.5,0.34]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.36,0.5,-0.84]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.92,0.5,-0.49]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.57,0.5,0.91]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.11,0.5,-0.97]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.98,0.5,0.39]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.21,0.5,0.99]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.99,0.5,-0.22]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.54,0.5,0.83]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.81,0.5,-0.55]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.77,0.5,0.68]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.69,0.5,-0.79]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.34,0.5,0.92]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.93,0.5,-0.35]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.61,0.5,0.73]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.75,0.5,-0.61]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.89,0.5,0.57]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.58,0.5,-0.88]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.42,0.5,0.81]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.82,0.5,-0.43]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[0.73,0.5,0.41]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.41,0.5,-0.73]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.41,0.5,-0.73]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.21,0.5,0.73]}
execute as @e[tag=fish_attack] at @s if score @s fish_assist matches 5 run summon minecraft:snowball ~ ~1 ~ {Owner:[I;1,2,3,4],Tags:["splash"],Motion:[-0.11,0.5,0.13]}
