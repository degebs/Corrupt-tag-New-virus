# this mode is when the corrupted dies but there are still some mobs left.
# the corrupted will efectly be in intermission mode as his last few zombies die
# no new zombies can spawn at this time

#sometimes mobs get stuck so to prevent a softlock we will kill all remaning mobs after 3 minutes of the corrupted being in intermission mode
scoreboard players add last_few_zombies_timer call_of_corrupted 1
execute if score last_few_zombies_timer call_of_corrupted matches 3600.. run kill @e[team=corrupted,type=!player]
execute if score last_few_zombies_timer call_of_corrupted matches 3600.. run scoreboard players reset last_few_zombies_timer call_of_corrupted


#===========================================================================================================================
# make sure the corrupted is in intermission mode

# make the atherial corrupted tiny and invisable
attribute @s scale base set 0.2
attribute @s entity_interaction_range base set 0
effect give @s invisibility 1 1 true
effect give @s jump_boost 1 1 true

attribute @s movement_speed base reset
attribute @s jump_strength base reset

#===========================================================================================================================
# count the remaining mobs and display it as a subtitle
scoreboard players set mobs call_of_corrupted 0
execute as @e[team=corrupted,type=!player] run scoreboard players add mobs call_of_corrupted 1
execute as @a run title @s subtitle [{"text":"remaining mobs: ","color":"red"},{"score":{"name":"mobs","objective":"call_of_corrupted"}}]
execute as @a run title @s title " "

# if it hits 0 run the intermission function to reset the game and start the next wave
#set it up first
execute if score mobs call_of_corrupted matches 0 run scoreboard players set intermission call_of_corrupted 0
execute if score mobs call_of_corrupted matches 0 if score intermission call_of_corrupted matches 2 run scoreboard players add wave call_of_corrupted 1

#execute if score mobs call_of_corrupted matches 0 run function ctnv:alternate_gamemode_functions/call_of_corrupted/intermission
execute if score mobs call_of_corrupted matches 0 run function ctnv:alternate_gamemode_functions/call_of_corrupted/game_start
execute if score mobs call_of_corrupted matches 0 run scoreboard players set atherial_corrupted call_of_corrupted 0

# prevent new spawning
scoreboard players set time spawn 500


# let the corrupted buy new upgrades in the shop
function ctnv:alternate_gamemode_functions/call_of_corrupted/corruption_intermission_shop

