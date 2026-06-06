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

# after 30 seconds switch to physical mode


execute if score intermission call_of_corrupted matches 600.. run title @a title [{"text":"WAVE: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}}]

execute if score intermission call_of_corrupted matches 600.. run title @a subtitle [{"text":"Intermission over!","color":"dark_red"}]
execute if score intermission call_of_corrupted matches 600.. run scoreboard players set atherial_corrupted call_of_corrupted 1



# prevent new spawning of mobs
scoreboard players set time spawn 500


#=================================================================================================
#class specific stuff

# reset the bulks totem variable
scoreboard players set @a[scores={bulk_totem=1..}] bulk_totem 0


# when it comes to cooldowns make sure that they dont immidialtly go off

# uncorrupted cooldowns
execute as @a[scores={class=2}] run scoreboard players set @s bulk 10

execute as @a[scores={class=1}] run scoreboard players set @s medic_heal 10
execute as @a[scores={class=7}] run scoreboard players set @s medic_heal 10
execute as @a[scores={class=7}] run scoreboard players set @s miner_lantern 10

scoreboard players set @a[scores={class=2}] acher_arrow_count 5
scoreboard players set @a[scores={class=8}] merchant_arrow_count 3
scoreboard players set @a[scores={class=8}] merchant_luck 4


scoreboard players set @a[scores={class=5}] trident_throw 0
scoreboard players set @a[scores={class=5}] stunman_trap 10

scoreboard players set @a[scores={class=6}] fishing_net_trap 3

scoreboard players set @a[scores={class=4}] assassin_charge 10
execute if score @s assassin_hide matches 1.. run scoreboard players reset @s assassin_hide

scoreboard players set @a[scores={class=9}] farm_cooldown 60
scoreboard players set @a[scores={class=9}] animal_farm_attack_cooldown 60

# corrupted cooldowns
execute as @a[scores={evil_class=1}] run scoreboard players set @s classic_corrupted_t1_cooldown 10
execute as @a[scores={evil_class=1}] run scoreboard players set @s classic_corrupted_t2_cooldown 10
execute as @a[scores={evil_class=1}] run scoreboard players set @s classic_corrupted_t3_cooldown 10

execute as @a[scores={evil_class=2}] run scoreboard players set @s predator_t1_speed_range 0
execute as @a[scores={evil_class=2}] run scoreboard players set @s predator_corrupted_t2_cooldown 10
execute as @a[scores={evil_class=2}] run scoreboard players set @s predator_corrupted_t2_cooldown 10

execute as @a[scores={evil_class=3}] run scoreboard players set @s apparition_light_level 0
execute as @a[scores={evil_class=3}] run scoreboard players set @s apparition_corrupted_t2_cooldown 10
execute as @a[scores={evil_class=3}] run scoreboard players set @s apparition_corrupted_t3_cooldown 10

execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_wind_charge_cooldown 0
execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_wind_charge_use 0


#execute as @a[scores={evil_class=3}] run scoreboard players set @s apparition_corrupted_t3_cooldown 0

execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t1_cooldown 10
execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t1_trap 20
execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t2_trap 20
execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t3_trap 20

execute as @a[scores={evil_class=5}] run scoreboard players set @s knight_corruption_blocker 5
execute as @a[scores={evil_class=5}] run scoreboard players set @s knight_reveal_players 5
execute as @a[scores={evil_class=5}] run scoreboard players set @s knight_speed_boost 5

execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_darkness 5
execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_speed_boost 5
execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_supernova 5

execute as @a[scores={evil_class=7}] run scoreboard players set @s manhunter_cooldown 0
execute as @a[scores={evil_class=7}] run scoreboard players set @s manhunter_horn_blow_detect 0

execute as @a[scores={evil_class=8}] run scoreboard players set @s gravity_pull_timer 0
execute as @a[scores={evil_class=8}] run scoreboard players add @s Reveal_Players_Modulator_timer 0

execute as @a[scores={evil_class=9}] run scoreboard players set @s marksman_arrow_count 3

execute as @a[scores={evil_class=10}] run scoreboard players set @s brewinator_drop_detect 0

