scoreboard players add intermission call_of_corrupted 1
execute if score intermission call_of_corrupted matches 1 run title @a subtitle [{"text":"Intermission! take 30 seconds to upgrade your gear","color":"dark_red"}]
# start the game mode in intermission mode, this is for the very begining of the game, and for when the runners win a round. the corrupted will have 30 seconds to prepare for the next round, and they can not interact with anything. they can only summon mobs. this is to give the runners a chance to get away and prepare for the next round

#==========================================================================================================================
# give the corrupted points.
# more points are given depending on the dificulty and the wave count. this is to give the corrupted a chance to catch up to the runners if they are behind, and to give them more points to spend on upgrades if they are doing well
#1.if easy give 100 points, if medium give 150 points, if hard give 200 points
#2. multiply by wave count

execute as @a[team=corrupted] at @s if score intermission call_of_corrupted matches 20 if score setting ST____COC_difuculty matches 0 run scoreboard players add @s points 100
execute as @a[team=corrupted] at @s if score intermission call_of_corrupted matches 20 if score setting ST____COC_difuculty matches 1 run scoreboard players add @s points 150
execute as @a[team=corrupted] at @s if score intermission call_of_corrupted matches 20 if score setting ST____COC_difuculty matches 2 run scoreboard players add @s points 200
execute as @a[team=corrupted] at @s if score intermission call_of_corrupted matches 20 run scoreboard players operation @s points *= wave call_of_corrupted


#==========================================================================================================================
#reset corrupted health

# the max health of the corrupted shall be calculated as such
# 1. take the max health of the runners
# 2. add the dificulty variable to it (0, 1 ,or 2)
# 3. add it by a variable caled "extra health" where the corrupted can buy more health every intermission
# 4. add the current wave count number to the max health

# make sure it does not blow up into infinity
#scoreboard players set @a[team=corrupted] health 0

# step 1
scoreboard players operation @a[team=corrupted] health = setting ST____max_health
# step 2
scoreboard players operation @a[team=corrupted] health += extra_corrupted_health COC_upgrades

# step 3
scoreboard players set multiplyer call_of_corrupted 2
scoreboard players operation @a[team=corrupted] health *= multiplyer call_of_corrupted

#step 4
scoreboard players operation @a[team=corrupted] health += wave call_of_corrupted

# extra step.
# afer the corrupted one dies. the death stun needs to be reset
scoreboard players set death_stun corruption_stun 6

#==========================================================================================================================
# make the atherial corrupted tiny and invisable
attribute @s scale base set 0.2
attribute @s entity_interaction_range base set 0
effect give @s invisibility 1 1 true
effect give @s jump_boost 1 1 true

attribute @s movement_speed base reset
attribute @s jump_strength base reset
effect give @s blindness 2 1 true

#===========================================================================================================================
# intermission corruption hud

title @a[team=corrupted] actionbar [{"text":"wave:","color":"red"},{"text":" ","color":"gold"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":"     Open your inentory to upgrade your items     ","color":"gold"},{"text":" $ ","color":"blue"},{"score":{"objective":"points","name":"*"}}]

scoreboard players reset mobs call_of_corrupted 
execute as @e[team=corrupted,type=!bat] run scoreboard players add mobs call_of_corrupted 1
# for the 30 seconds the corrupted can access this own shop

execute if score intermission call_of_corrupted matches ..598 run function ctnv:alternate_gamemode_functions/call_of_corrupted/corruption_intermission_shop
execute if score intermission call_of_corrupted matches ..590 as @a[team=runners] at @s run function ctnv:alternate_gamemode_functions/call_of_corrupted/runner_intermission_shop
execute if score intermission call_of_corrupted matches 595.. run kill @e[type=item]
execute if score intermission call_of_corrupted matches 599.. run clear @a

#===========================================================================================================================

# set the current corrupte class that the corrupted has to 1
execute if score @p[team=corrupted] evil_class matches 1 run scoreboard players set corruptor unlocked_corrupted_classes 1
execute if score @p[team=corrupted] evil_class matches 2 run scoreboard players set predator unlocked_corrupted_classes 1
execute if score @p[team=corrupted] evil_class matches 3 run scoreboard players set apparition unlocked_corrupted_classes 1
execute if score @p[team=corrupted] evil_class matches 4 run scoreboard players set artificer unlocked_corrupted_classes 1
execute if score @p[team=corrupted] evil_class matches 5 run scoreboard players set knight unlocked_corrupted_classes 1
execute if score @p[team=corrupted] evil_class matches 6 run scoreboard players set dark_star unlocked_corrupted_classes 1
execute if score @p[team=corrupted] evil_class matches 7 run scoreboard players set manhunter unlocked_corrupted_classes 1


#===========================================================================================================================

# after 30 seconds switch to etherial mode
# explain what be etherial means
execute if score intermission call_of_corrupted matches 600.. run tellraw @a[team=corrupted] [{"text":"you are now atherial... you cannot ineract with anything.\n you must summon waves of corrupted to kill the runners. \n Dont get close to the runners until you aquire a physical form!","color":"light_purple"}]


execute if score intermission call_of_corrupted matches 600.. run title @a title [{"text":"WAVE: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}}]

execute if score intermission call_of_corrupted matches 600.. run title @a subtitle [{"text":"Intermission over!","color":"dark_red"}]
execute if score intermission call_of_corrupted matches 600.. run scoreboard players set atherial_corrupted call_of_corrupted 1