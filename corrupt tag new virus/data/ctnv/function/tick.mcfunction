
#    ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄    ▄ 
#   ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌
#    ▀▀▀▀█░█▀▀▀▀  ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░▌ ▐░▌ 
#        ▐░▌          ▐░▌     ▐░▌          ▐░▌▐░▌  
#        ▐░▌          ▐░▌     ▐░▌          ▐░▌░▌   
#        ▐░▌          ▐░▌     ▐░▌          ▐░░▌    
#        ▐░▌          ▐░▌     ▐░▌          ▐░▌░▌   
#        ▐░▌          ▐░▌     ▐░▌          ▐░▌▐░▌  
#        ▐░▌      ▄▄▄▄█░█▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░▌ ▐░▌ 
#        ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌
#         ▀       ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀    ▀ 
                                               


#---check if debug mode is off. and if its off keep everyone OUT OF CREATIVE MODE (dont let them do shit)

execute unless score game state matches -1 run function ctnv:gamemodeenforcement



# ---------------update the universal time function- keep it from going past 20
scoreboard players add tick time 1
execute if score tick time matches 20 run scoreboard players set tick time 0

scoreboard players add 360 time 5
execute if score 360 time matches 360.. run scoreboard players set 360 time 0

#---------clamp the value of toggle debug between 0 and 1 (for the debug mode)
execute if score toggle debug matches 2 run scoreboard players set toggle debug 0





#-------------keep track on how many players there are
# Check if a player has the "joined" score
# Step 1: Detect player joins and increment player_count
scoreboard players set Online players_online 0
execute as @a run scoreboard players add Online players_online 1
scoreboard players operation Online playerlist = Online players_online


#check if someone tried to kill @e
# use this function to kill a map beacon
#
# it is absolutly IMPARATIVE that the map beacon counter remains accurate
#the proper destruction of a map beacon requires every element in it to be killed BEFORE we update the counter
#here the life detector armor stand detects if someone tried to kill all 
#  
#execute unless entity @e[tag=life_detector] run tellraw @a ["",{"text":"CRITICAL ERROR: ALL BEACONS WERE DESTROYED","color":"dark_red"}]
#execute unless entity @e[tag=life_detector] run scoreboard players set avalable_map_index debug 1
#execute unless entity @e[tag=life_detector] run forceload remove all
#execute unless entity @e[tag=life_detector] run scoreboard players set map_beacon_count debug 0
# if the life detector dies we can assume at least one beacon was destroyed improperly.. to fix this we will destroy all beacons just in case
#execute unless entity @e[tag=life_detector] run kill @e[type=armor_stand]
#execute unless entity @e[tag=life_detector] run kill @e[type=turtle]
#execute unless entity @e[tag=life_detector] run reload
# i am making the life detector completly obsolete becasue its casung a ton of bugs that used to not exist
# these bugs seem sever depenendant, witch means they only happen not on my pc

# update every players unique id
execute as @a unless score @s player_ID matches 1.. store result score @s player_ID run scoreboard players add #nextID player_ID 1

#======================================================================================================================
# dead players will know how corrupted any player is at any time
# this can be done by giving them there own scoreboard
execute if score game state matches 3.. if entity @a[team=dead] run function ctnv:one_time_function/scoreboard_on_death
clear @a[team=dead]
#======================================================================================================================
# it doesnt matter when this code runs gray dye will always be eliminated
execute if score tick time matches 7 run kill @e[type=item,nbt={Item:{id:"minecraft:gray_dye"}}]

#======================================================================================================================
# migdame calling cards
execute if score game state matches 3.. run function ctnv:one_time_function/calling_cards/calling_card_midgame
#======================================================================================================================

#
#                                                               /$$                 /$$              
#                                                              | $$                | $$              
#  /$$$$$$   /$$$$$$  /$$$$$$/$$$$   /$$$$$$         /$$$$$$$ /$$$$$$    /$$$$$$  /$$$$$$    /$$$$$$ 
# /$$__  $$ |____  $$| $$_  $$_  $$ /$$__  $$       /$$_____/|_  $$_/   |____  $$|_  $$_/   /$$__  $$
#| $$  \ $$  /$$$$$$$| $$ \ $$ \ $$| $$$$$$$$      |  $$$$$$   | $$      /$$$$$$$  | $$    | $$$$$$$$
#| $$  | $$ /$$__  $$| $$ | $$ | $$| $$_____/       \____  $$  | $$ /$$ /$$__  $$  | $$ /$$| $$_____/
#|  $$$$$$$|  $$$$$$$| $$ | $$ | $$|  $$$$$$$       /$$$$$$$/  |  $$$$/|  $$$$$$$  |  $$$$/|  $$$$$$$
# \____  $$ \_______/|__/ |__/ |__/ \_______/      |_______/    \___/   \_______/   \___/   \_______/
# /$$  \ $$                                                                                          
#|  $$$$$$/                                                                                          
# \______/                                                                                           

#----------keep track of what the current game state is
execute if score game state matches -1 run function ctnv:gamestates/gamestate_-1
execute if score game state matches 0 run function ctnv:gamestates/gamestate_0
execute if score game state matches 1 run function ctnv:gamestates/gamestate_1
execute if score game state matches 2 run function ctnv:gamestates/gamestate_2
execute if score game state matches 3 run function ctnv:gamestates/gamestate_3
execute if score game state matches 4 run function ctnv:gamestates/gamestate_4
execute if score game state matches 5 run function ctnv:gamestates/gamestate_5
execute if score game state matches 6 run function ctnv:gamestates/gamestate_6
execute if score game state matches 7 run function ctnv:gamestates/gamestate_7
execute if score game state matches 8 run function ctnv:gamestates/gamestate_8

