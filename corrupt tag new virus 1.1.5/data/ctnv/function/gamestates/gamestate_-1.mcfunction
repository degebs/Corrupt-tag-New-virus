
#██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗            ██╗
#██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝           ███║
#██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗    █████╗╚██║
#██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║    ╚════╝ ██║
#██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝           ██║
#╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝            ╚═╝
                                                        


# this funtion happens every tick when debug mode is on
# this function will mostly be used to render beacons



# fancy efffects for the loby beacon
execute at @e[tag=lobby] run particle minecraft:happy_villager ~ ~ ~ 0.0 3 0.0 0 3


# -0-----------------------fancy efffects for the map beacon beacon------------------------------------------

execute at @e[tag=map,type=armor_stand] run particle dust{color:[0.62,0.0,0.57],scale:2} ^ ^1 ^5 0 0 0 0.1 6
execute at @e[tag=map,type=armor_stand] run particle dripping_lava ~ ~ ~ 0.1 5 0.1 1 10

# Store the "360" score into temporary storage
execute store result storage minecraft:temp angle int 1 run scoreboard players get 360 time

# Apply the stored value to the armor stand's yaw rotation
execute as @e[type=armor_stand,tag=map] store result entity @s Rotation[0] float 1 run data get storage minecraft:temp angle

# show the hight of the life detecter using a lot of particles
#execute at @e[type=armor_stand,tag=life_detector] run particle minecraft:electric_spark ~ ~ ~ 0 10 0 0.1 400
#effect give @e[type=armor_stand,tag=life_detector] minecraft:glowing 1 0 true

# highlight the selected map( if there is one)
execute as @e[scores={map_selection=1}] run effect give @s glowing 1
execute as @e[type=turtle,scores={map_selection=1}] at @s run scoreboard players set @e[type=armor_stand,sort=nearest,limit=1] spawning_circle 1
execute as @e[scores={spawning_circle=1}] run effect give @s minecraft:glowing 1
# resize the turtles
execute as @e[type=turtle] run attribute @s scale base set 1

# game rule
gamerule sendCommandFeedback true


#=================================================================================================
scoreboard players reset count reload_spam
# this is here so that the prompt to use the party leader change command does not spam the chat

