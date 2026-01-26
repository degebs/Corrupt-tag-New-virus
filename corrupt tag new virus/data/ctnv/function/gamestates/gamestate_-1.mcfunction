
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
effect give @e[type=armor_stand,tag=life_detector] minecraft:glowing 1 1 true

# highlight the selected map( if there is one)
execute as @e[scores={map_selection=1}] run effect give @s glowing 1
execute as @e[type=turtle,scores={map_selection=1}] at @s run scoreboard players set @e[type=armor_stand,sort=nearest,limit=1] spawning_circle 1
execute as @e[scores={spawning_circle=1}] run effect give @s minecraft:glowing 1
# resize the turtles
execute as @e[type=turtle] run attribute @s scale base set 1

# game rule
gamerule send_command_feedback true


#=================================================================================================
scoreboard players reset count reload_spam
# this is here so that the prompt to use the party leader change command does not spam the chat

#======================================================================================================================
# there is a bug where the "avalable_map_inex" scoreboard objective gets set to 0 when the game starts
# when this happens the turltes are still avive but unaccounted for. this causes major issues with map selection

# if the map index does not match the number of turtles that exist, then we have a desync issue
# say a message in chat to inform the user of this issue


# set up the live_map_beacon_count scoreboard to match the number of turtles that exist
scoreboard players set live_map_beacon_count debug 0
execute as @e[type=turtle,tag=map] if score live_map_beacon_count debug matches 0.. run scoreboard players add live_map_beacon_count debug 1

# if the live count does not match the map beacon count, we have a serious issue
# execute unless score live_map_beacon_count debug = count debug run tellraw @a ["",{"text":"WARNING: MAP BEACON COUNT MISMATCH DETECTED. FIXING...","color":"red"}]
execute unless score live_map_beacon_count debug = count debug run scoreboard players operation count debug = live_map_beacon_count debug

