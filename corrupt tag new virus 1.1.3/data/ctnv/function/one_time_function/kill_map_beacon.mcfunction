# use this function to kill a map beacon
#
# it is absolutly IMPARATIVE that the map beacon counter remains accurate
#the proper destruction of a map beacon requires every element in it to be killed BEFORE we update the counter
#=============================================================================================================

#throw error if no beacon nearby
execute unless entity @e[type=turtle,distance=..13] run tellraw @a ["",{"text":"error: no nearby beacon. try getting closer to the turtle","color":"dark_red"}]



#particles and fanfair
execute if entity @e[type=turtle,distance=..13] run playsound entity.generic.explode block @s ~ ~ ~ 1 1
execute if entity @e[type=turtle,distance=..13] run particle explosion_emitter ~ ~ ~ 0.5 0.5 0.5 2 3

# a bunch of index math
execute if entity @e[type=turtle,distance=..13] run scoreboard players operation deleted_index debug = @e[type=turtle,distance=..13] ordered_map_list
execute if entity @e[type=turtle,distance=..13] run execute as @e[type=turtle] if score @s ordered_map_list > deleted_index debug run scoreboard players remove @s ordered_map_list 1
execute if entity @e[type=turtle,distance=..13] run scoreboard players remove avalable_map_index debug 1
# the actuall funtction that kills a beacon safely
execute if entity @e[type=turtle,distance=..13] run kill @e[type=armor_stand,name=map,distance=..5]
execute if entity @e[type=turtle,distance=..13] run scoreboard players remove map_beacon_count debug 1
execute if entity @e[type=turtle,distance=..13] run tellraw @a ["",{"text":"there are ","color":"gold"},{"color":"gold","score":{"objective":"debug","name":"map_beacon_count"}},{"color":"gold","text":" map beacons alive "}]
execute if entity @e[type=turtle,distance=..13] run forceload remove ~ ~
execute if entity @e[type=turtle,distance=..13] run kill @e[type=turtle,distance=..5]
execute if entity @e[type=turtle,distance=..13] run tp @e[tag=life_detector] ~ ~-1 ~

#detect how many maps are alive (in case its -1)

execute if score map_beacon_count debug matches ..-1 run tellraw @a ["",{"text":"ERROR: MAP BEACON DESYNC OCCURED","color":"dark_red"}]
execute if score map_beacon_count debug matches ..-1 run scoreboard players set map_beacon_count debug 0
execute if score map_beacon_count debug matches ..-1 run tp @e[tag=life_detector] ~ 0 ~
 
