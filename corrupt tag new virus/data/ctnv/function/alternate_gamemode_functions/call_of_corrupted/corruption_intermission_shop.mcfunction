
#==========================================================================================================================
#reset corrupted health

# the max health of the corrupted shall be calculated as such
# 1. take the max health of the runners
# 2. add the dificulty variable to it (0, 1 ,or 2)
# 3. multiply by 2
# 4. add the current wave count number to the max health
# 5. add the extra health of the corrupted that can be bought in the intermission shop

# make sure it does not blow up into infinity
#scoreboard players set @a[team=corrupted] health 0

# step 1
scoreboard players operation @a[team=corrupted] health = setting ST____max_health
# step 2
scoreboard players operation @a[team=corrupted] health += setting ST____COC_difuculty

# step 3
scoreboard players set multiplyer call_of_corrupted 2
scoreboard players operation @a[team=corrupted] health *= multiplyer call_of_corrupted

#step 4
scoreboard players operation @a[team=corrupted] health += wave call_of_corrupted

# step 5
scoreboard players operation @a[team=corrupted] health += extra_corrupted_health call_of_corrupted


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor ominous_bottle if score @s points matches ..99 run tellraw @s [{"text":"Not enough points!","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run scoreboard players add extra_corrupted_health call_of_corrupted 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run tellraw @s [{"text":"Health Upgraded!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run scoreboard players remove @s points 100

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] ominous_bottle


#3 place the item in the invetory
item replace entity @a[team=corrupted] inventory.1 with ominous_bottle[custom_name="buy more health for $100"]
#=================================================================================================




# these next few clickable items are for unlocking the corrupted classes





#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor chorus_fruit if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor chorus_fruit if score @s points matches 500.. run scoreboard players set corruptor unlocked_corrupted_classes 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor chorus_fruit if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor chorus_fruit if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor chorus_fruit if score @s points matches 500.. run tellraw @s [{"text":"Class Unlocked!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor chorus_fruit if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] chorus_fruit

# CORRUPTOR CLASS UNLOCK
#3 place the item in the invetory
execute if score corruptor unlocked_corrupted_classes matches 0 run item replace entity @a[team=corrupted] inventory.19 with chorus_fruit[custom_name=[{"text":"Corruptor","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain an item to see the location of all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a speed boost item","italic":false,"color":"white"}],[{"text":"=== 75% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a fruit to teleport you to a random player","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\" Blessed be the ones who don't get away from me and dies... DIES! .\"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]
#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor netherite_sword if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor netherite_sword if score @s points matches 500.. run scoreboard players set predator unlocked_corrupted_classes 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor netherite_sword if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor netherite_sword if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor netherite_sword if score @s points matches 500.. run tellraw @s [{"text":"Class Unlocked!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor netherite_sword if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] netherite_sword

# PREDATOR CLASS UNLOCK
#3 place the item in the invetory
execute if score predator unlocked_corrupted_classes matches 0 run item replace entity @a[team=corrupted] inventory.20 with netherite_sword[custom_name=[{"text":"Predator","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- smell the fear of the runners, the smell fules your speed boost (passive)","italic":false,"color":"white"}],[{"text":"- slowness when far away from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a invisability item","italic":false,"color":"white"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain an item to remotly stun all runners ","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\" IM HERE TO MEET A 12 YEAR OLD CHILD!! IM HERE TO MEET A 12 YEAR OLD CHILD!! \"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]
#=================================================================================================




#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor vex_spawn_egg if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor vex_spawn_egg if score @s points matches 500.. run scoreboard players set apparition unlocked_corrupted_classes 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor vex_spawn_egg if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor vex_spawn_egg if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor vex_spawn_egg if score @s points matches 500.. run tellraw @s [{"text":"Class Unlocked!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor vex_spawn_egg if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] vex_spawn_egg

# APPARATION CLASS UNLOCK
#3 place the item in the invetory
execute if score apparition unlocked_corrupted_classes matches 0 run item replace entity @a[team=corrupted] inventory.21 with vex_spawn_egg[custom_name=[{"text":"Apparition","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent invisability","italic":false,"color":"white"}],[{"text":"- slowness when close from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- speed boost in darkness","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- recharging enderperal","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\" AND I will never see anything of light ","italic":false,"color":"red"}],[{"text":"But whom, But whom","italic":false,"color":"red"}],[{"text":"are willing for disair and gloom \"","italic":false,"color":"red"}]]]

#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor tnt if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor tnt if score @s points matches 500.. run scoreboard players set artificer unlocked_corrupted_classes 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor tnt if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor tnt if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor tnt if score @s points matches 500.. run tellraw @s [{"text":"Class Unlocked!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor tnt if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] tnt

# Artificer CLASS UNLOCK
#3 place the item in the invetory
execute if score artificer unlocked_corrupted_classes matches 0 run item replace entity @a[team=corrupted] inventory.22 with tnt[custom_name=[{"text":"Artificer","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain the ability to place traps","italic":false,"color":"white"}],[{"text":"- gain an item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain superior traps","italic":false,"color":"white"}],[{"text":"- jump boost","italic":false,"color":"white"}],[{"text":"=== 80% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain a sentry trap","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"I have become Death destroyer of worlds.\"","italic":false,"color":"red"}]]]

#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor netherite_helmet if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor netherite_helmet if score @s points matches 500.. run scoreboard players set knight unlocked_corrupted_classes 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor netherite_helmet if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor netherite_helmet if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor netherite_helmet if score @s points matches 500.. run tellraw @s [{"text":"Class Unlocked!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor netherite_helmet if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] netherite_helmet

# KNIGHT CLASS UNLOCK
#3 place the item in the invetory
execute if score knight unlocked_corrupted_classes matches 0 run item replace entity @s inventory.23 with netherite_helmet[custom_name=[{"text":"Knight","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent damage boost","italic":false,"color":"white"}],[{"text":"- full stun and knockback immunity","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed bost item","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a temorary cure to halt the corruption","italic":false,"color":"white"}],[{"text":"-permanent jump boost","italic":false,"color":"white"}],[{"text":"-permanent speed boost","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"The will of the empire demands you pay taxes PESANT! \"","italic":false,"color":"red"}]]]

#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor nether_star if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor nether_star if score @s points matches 500.. run scoreboard players set dark_star unlocked_corrupted_classes 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor nether_star if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor nether_star if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor nether_star if score @s points matches 500.. run tellraw @s [{"text":"Class Unlocked!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor nether_star if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] nether_star

# DARK STAR CLASS UNLOCK
#3 place the item in the invetory
execute if score dark_star unlocked_corrupted_classes matches 0 run item replace entity @s inventory.24 with nether_star[custom_name=[{"text":"Dark Star","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"- gain an item to blind all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed bost item","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- supreme supernova! bathe the entire world in fire","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"Im not corrupted, i just know the truth of the universe \"","italic":false,"color":"red"}]]]

#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute as @a[team=corrupted] if items entity @s player.cursor netherite_spear if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
# if enoguh points give them the item and take the points
execute as @a[team=corrupted] if items entity @s player.cursor netherite_spear if score @s points matches 500.. run scoreboard players set manhunter unlocked_corrupted_classes 1
execute as @a[team=corrupted] at @s if items entity @s player.cursor netherite_spear if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=corrupted] at @s if items entity @s player.cursor netherite_spear if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=corrupted] if items entity @s player.cursor netherite_spear if score @s points matches 500.. run tellraw @s [{"text":"Class Unlocked!","color":"green"}]
execute as @a[team=corrupted] if items entity @s player.cursor netherite_spear if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
clear @a[team=corrupted] netherite_spear

# Manhunter CLASS UNLOCK
#3 place the item in the invetory
execute if score manhunter unlocked_corrupted_classes matches 0 run item replace entity @s inventory.25 with netherite_spear[custom_name=[{"text":"Manhunter","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 1 spear","italic":false,"color":"white"}],[{"text":"- gain an item to reveal the nearest runner, and stun them","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":" Lunge 2 spear","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 3 spear","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"Mercury has entered its retrograde, my genocide will be countless.\"","italic":false,"color":"red"}]]]
#=================================================================================================

