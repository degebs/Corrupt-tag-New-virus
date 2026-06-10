
#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute if score @s health matches ..4 if items entity @s player.cursor ominous_bottle if score @s points matches ..99 run tellraw @s [{"text":"Not enough points!","color":"red"}]
# if enoguh points give them the item and take the points
execute if score @s health matches ..4 if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run scoreboard players add @s health 1
execute if score @s health matches ..4 if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run playsound block.bell.resonate master @s
execute if score @s health matches ..4 if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run playsound block.bell.use master @s
execute if score @s health matches ..4 if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run tellraw @s [{"text":"Health Upgraded!","color":"green"}]
execute if score @s health matches ..4 if items entity @s player.cursor ominous_bottle if score @s points matches 100.. run scoreboard players remove @s points 100

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
execute if score @s health matches ..4 run clear @s ominous_bottle

# this price is if less than 4 health
#3 place the item in the invetory
execute if score @s health matches ..4 run item replace entity @s inventory.1 with ominous_bottle[custom_name="buy more health for $100"]
#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute if score @s health matches 5..7 if items entity @s player.cursor ominous_bottle if score @s points matches ..199 run tellraw @s [{"text":"Not enough points!","color":"red"}]
# if enoguh points give them the item and take the points
execute if score @s health matches 5..7 if items entity @s player.cursor ominous_bottle if score @s points matches 200.. run scoreboard players add @s health 1
execute if score @s health matches 5..7 if items entity @s player.cursor ominous_bottle if score @s points matches 200.. run playsound block.bell.resonate master @s
execute if score @s health matches 5..7 if items entity @s player.cursor ominous_bottle if score @s points matches 200.. run playsound block.bell.use master @s
execute if score @s health matches 5..7 if items entity @s player.cursor ominous_bottle if score @s points matches 200.. run tellraw @s [{"text":"Health Upgraded!","color":"green"}]
execute if score @s health matches 5..7 if items entity @s player.cursor ominous_bottle if score @s points matches 200.. run scoreboard players remove @s points 200

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
execute if score @s health matches 5..7 run clear @s ominous_bottle

# this price is if 5 to 7 health
#3 place the item in the invetory
execute if score @s health matches 5..7 run item replace entity @s inventory.1 with ominous_bottle[custom_name="buy more health for $200"]
#=================================================================================================

#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute if score @s health matches 8..10 if items entity @s player.cursor ominous_bottle if score @s points matches ..299 run tellraw @s [{"text":"Not enough points!","color":"red"}]
# if enoguh points give them the item and take the points
execute if score @s health matches 8..10 if items entity @s player.cursor ominous_bottle if score @s points matches 300.. run scoreboard players add @s health 1
execute if score @s health matches 8..10 if items entity @s player.cursor ominous_bottle if score @s points matches 300.. run playsound block.bell.resonate master @s
execute if score @s health matches 8..10 if items entity @s player.cursor ominous_bottle if score @s points matches 300.. run playsound block.bell.use master @s
execute if score @s health matches 8..10 if items entity @s player.cursor ominous_bottle if score @s points matches 300.. run tellraw @s [{"text":"Health Upgraded!","color":"green"}]
execute if score @s health matches 8..10 if items entity @s player.cursor ominous_bottle if score @s points matches 300.. run scoreboard players remove @s points 300

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
execute if score @s health matches 8..10 run clear @s ominous_bottle

# this price is if 8 to 10 health
#3 place the item in the invetory
execute if score @s health matches 8..10 run item replace entity @s inventory.1 with ominous_bottle[custom_name="buy more health for $300"]
#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute if score @s health matches 11..13 if items entity @s player.cursor ominous_bottle if score @s points matches ..399 run tellraw @s [{"text":"Not enough points!","color":"red"}]
# if enoguh points give them the item and take the points
execute if score @s health matches 11..13 if items entity @s player.cursor ominous_bottle if score @s points matches 400.. run scoreboard players add @s health 1
execute if score @s health matches 11..13 if items entity @s player.cursor ominous_bottle if score @s points matches 400.. run playsound block.bell.resonate master @s
execute if score @s health matches 11..13 if items entity @s player.cursor ominous_bottle if score @s points matches 400.. run playsound block.bell.use master @s
execute if score @s health matches 11..13 if items entity @s player.cursor ominous_bottle if score @s points matches 400.. run tellraw @s [{"text":"Health Upgraded!","color":"green"}]
execute if score @s health matches 11..13 if items entity @s player.cursor ominous_bottle if score @s points matches 400.. run scoreboard players remove @s points 400

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
execute if score @s health matches 11..13 run clear @s ominous_bottle

# this price is if 11 to 13 health
#3 place the item in the invetory
execute if score @s health matches 11..13 run item replace entity @s inventory.1 with ominous_bottle[custom_name="buy more health for $400"]
#=================================================================================================


#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute if score @s health matches 14..19 if items entity @s player.cursor ominous_bottle if score @s points matches ..499 run tellraw @s [{"text":"Not enough points!","color":"red"}]
# if enoguh points give them the item and take the points
execute if score @s health matches 14..19 if items entity @s player.cursor ominous_bottle if score @s points matches 500.. run scoreboard players add @s health 1
execute if score @s health matches 14..19 if items entity @s player.cursor ominous_bottle if score @s points matches 500.. run playsound block.bell.resonate master @s
execute if score @s health matches 14..19 if items entity @s player.cursor ominous_bottle if score @s points matches 500.. run playsound block.bell.use master @s
execute if score @s health matches 14..19 if items entity @s player.cursor ominous_bottle if score @s points matches 500.. run tellraw @s [{"text":"Health Upgraded!","color":"green"}]
execute if score @s health matches 14..19 if items entity @s player.cursor ominous_bottle if score @s points matches 500.. run scoreboard players remove @s points 500

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
execute if score @s health matches 14..19 run clear @s ominous_bottle

# this price is if 14..19 health
#3 place the item in the invetory
execute if score @s health matches 14..19 run item replace entity @s inventory.1 with ominous_bottle[custom_name="buy more health for $500"]
#=================================================================================================




#=================================================================================================
# item selection (this method is soo much beter that the one in the original intermission shop) no need to set up delay timers

# 1. check if clicked and run the fuction within
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# execute as @a if items entity @s player.cursor ominous_bottle run say Click!

# if not enough points just give them a message
execute if score @s health matches 20.. if items entity @s player.cursor ominous_bottle if score @s points matches ..999 run tellraw @s [{"text":"Not enough points!","color":"red"}]
# if enoguh points give them the item and take the points
execute if score @s health matches 20.. if items entity @s player.cursor ominous_bottle if score @s points matches 1000.. run scoreboard players add @s health 1
execute if score @s health matches 20.. if items entity @s player.cursor ominous_bottle if score @s points matches 1000.. run playsound block.bell.resonate master @s
execute if score @s health matches 20.. if items entity @s player.cursor ominous_bottle if score @s points matches 1000.. run playsound block.bell.use master @s
execute if score @s health matches 20.. if items entity @s player.cursor ominous_bottle if score @s points matches 1000.. run tellraw @s [{"text":"Health Upgraded!","color":"green"}]
execute if score @s health matches 20.. if items entity @s player.cursor ominous_bottle if score @s points matches 1000.. run scoreboard players remove @s points 1000

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2. clear the click tag
execute if score @s health matches 20.. run clear @s ominous_bottle

# this price is if 20+ health
#3 place the item in the invetory
execute if score @s health matches 20.. run item replace entity @s inventory.1 with ominous_bottle[custom_name="buy more health for $1000"]
#=================================================================================================


#=================================================================================================
# SPEED BOOST - inventory.9 (5 minutes of Speed I)
execute as @a[team=runners] if items entity @s player.cursor sugar if score @s points matches ..199 run tellraw @s [{"text":"Not enough points! you need $200","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor sugar if score @s points matches 200.. run effect give @s speed 6000 0 true
execute as @a[team=runners] at @s if items entity @s player.cursor sugar if score @s points matches 200.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor sugar if score @s points matches 200.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor sugar if score @s points matches 200.. run tellraw @s [{"text":"Speed Boost Purchased! 5 minutes of Speed I","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor sugar if score @s points matches 200.. run scoreboard players remove @s points 200
clear @a[team=runners] sugar
item replace entity @a[team=runners] inventory.9 with sugar[custom_name=[{"text":"Speed Boost","italic":false,"color":"dark_purple"}],lore=[[{"text":"Gives you Speed I for 5 minutes","italic":false,"color":"white"}],[{"text":"Can be repurchased","italic":false,"color":"gray"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $200","italic":false,"color":"gold"}]]]
#=================================================================================================

#=================================================================================================
# EXPLOSIVES - inventory.13
execute as @a[team=runners] if items entity @s player.cursor red_candle if score @s points matches ..299 run tellraw @s [{"text":"Not enough points! you need $300","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor red_candle if score @s points matches 300.. run scoreboard players add @s runner_TNT_purchased 1
execute as @a[team=runners] at @s if items entity @s player.cursor red_candle if score @s points matches 300.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor red_candle if score @s points matches 300.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor red_candle if score @s points matches 300.. run tellraw @s [{"text":"Explosives Purchased!","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor red_candle if score @s points matches 300.. run scoreboard players remove @s points 800
clear @a[team=runners] red_candle
item replace entity @a[team=runners] inventory.13 with red_candle[custom_name=[{"text":"Explosives","italic":false,"color":"dark_purple"}],lore=[[{"text":"Gives you a TNT stick after the intermission","italic":false,"color":"white"}],[{"text":"Can be repurchased","italic":false,"color":"gray"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $300","italic":false,"color":"gold"}]]]
#=================================================================================================

#=================================================================================================
# JUMP BOOST - inventory.10 (5 minutes of Jump Boost I)
execute as @a[team=runners] if items entity @s player.cursor rabbit_foot if score @s points matches ..199 run tellraw @s [{"text":"Not enough points! you need $200","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor rabbit_foot if score @s points matches 200.. run effect give @s jump_boost 6000 0 true
execute as @a[team=runners] at @s if items entity @s player.cursor rabbit_foot if score @s points matches 200.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor rabbit_foot if score @s points matches 200.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor rabbit_foot if score @s points matches 200.. run tellraw @s [{"text":"Jump Boost Purchased! 5 minutes of Jump Boost I","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor rabbit_foot if score @s points matches 200.. run scoreboard players remove @s points 200
clear @a[team=runners] rabbit_foot
item replace entity @a[team=runners] inventory.10 with rabbit_foot[custom_name=[{"text":"Jump Boost","italic":false,"color":"dark_purple"}],lore=[[{"text":"Gives you Jump Boost I for 5 minutes","italic":false,"color":"white"}],[{"text":"Can be repurchased","italic":false,"color":"gray"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $200","italic":false,"color":"gold"}]]]
#=================================================================================================

#=================================================================================================
# POWERFUL SPEED BOOST - inventory.18 (10 minutes of Speed II)
execute as @a[team=runners] if items entity @s player.cursor nether_wart if score @s points matches ..699 run tellraw @s [{"text":"Not enough points! you need $700","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor nether_wart if score @s points matches 700.. run effect give @s speed 12000 1 true
execute as @a[team=runners] at @s if items entity @s player.cursor nether_wart if score @s points matches 700.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor nether_wart if score @s points matches 700.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor nether_wart if score @s points matches 700.. run tellraw @s [{"text":"Powerful Speed Boost Purchased! 10 minutes of Speed II","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor nether_wart if score @s points matches 700.. run scoreboard players remove @s points 700
clear @a[team=runners] nether_wart
item replace entity @a[team=runners] inventory.18 with nether_wart[custom_name=[{"text":"Powerful Speed Boost","italic":false,"color":"dark_purple"}],lore=[[{"text":"Gives you Speed II for 10 minutes","italic":false,"color":"white"}],[{"text":"Can be repurchased","italic":false,"color":"gray"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $700","italic":false,"color":"gold"}]]]
#=================================================================================================

#=================================================================================================
# POWERFUL JUMP BOOST - inventory.19 (10 minutes of Jump Boost II)
execute as @a[team=runners] if items entity @s player.cursor ghast_tear if score @s points matches ..699 run tellraw @s [{"text":"Not enough points! you need $700","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor ghast_tear if score @s points matches 700.. run effect give @s jump_boost 12000 1 true
execute as @a[team=runners] at @s if items entity @s player.cursor ghast_tear if score @s points matches 700.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor ghast_tear if score @s points matches 700.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor ghast_tear if score @s points matches 700.. run tellraw @s [{"text":"Powerful Jump Boost Purchased! 10 minutes of Jump Boost II","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor ghast_tear if score @s points matches 700.. run scoreboard players remove @s points 700
clear @a[team=runners] ghast_tear
item replace entity @a[team=runners] inventory.19 with ghast_tear[custom_name=[{"text":"Powerful Jump Boost","italic":false,"color":"dark_purple"}],lore=[[{"text":"Gives you Jump Boost II for 10 minutes","italic":false,"color":"white"}],[{"text":"Can be repurchased","italic":false,"color":"gray"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $700","italic":false,"color":"gold"}]]]
#=================================================================================================

#=================================================================================================
# INVISIBILITY - inventory.0 (3 minutes of Invisibility)
execute as @a[team=runners] if items entity @s player.cursor fermented_spider_eye if score @s points matches ..499 run tellraw @s [{"text":"Not enough points! you need $500","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor fermented_spider_eye if score @s points matches 500.. run effect give @s invisibility 3600 0 true
execute as @a[team=runners] at @s if items entity @s player.cursor fermented_spider_eye if score @s points matches 500.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor fermented_spider_eye if score @s points matches 500.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor fermented_spider_eye if score @s points matches 500.. run tellraw @s [{"text":"Invisibility Purchased! 3 minutes of Invisibility","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor fermented_spider_eye if score @s points matches 500.. run scoreboard players remove @s points 500
clear @a[team=runners] fermented_spider_eye
item replace entity @a[team=runners] inventory.0 with fermented_spider_eye[custom_name=[{"text":"Invisibility","italic":false,"color":"dark_purple"}],lore=[[{"text":"Gives you Invisibility for 3 minutes","italic":false,"color":"white"}],[{"text":"Can be repurchased","italic":false,"color":"gray"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $500","italic":false,"color":"gold"}]]]
#=================================================================================================

#=================================================================================================
# range increase - inventory.2 one time purchase that permanently increases the range of your attack
scoreboard objectives add purchased_range dummy
# PERMANENT RANGE INCREASE - inventory.2 (one-time purchase, +1 block attack range)
# First, create the scoreboard objective if it doesn't exist (run once, e.g., in load function)
# scoreboard objectives add purchased_range dummy

execute as @a[team=runners] if items entity @s player.cursor prismarine_shard if score @s purchased_range matches 0 if score @s points matches ..1999 run tellraw @s [{"text":"Not enough points! you need $2000","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor prismarine_shard if score @s purchased_range matches 0 if score @s points matches 2000.. run scoreboard players set @s purchased_range 1
execute as @a[team=runners] if items entity @s player.cursor prismarine_shard if score @s purchased_range matches 0 if score @s points matches 2000.. run attribute @s entity_interaction_range base set 4
execute as @a[team=runners] at @s if items entity @s player.cursor prismarine_shard if score @s purchased_range matches 0 if score @s points matches 2000.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor prismarine_shard if score @s purchased_range matches 0 if score @s points matches 2000.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor prismarine_shard if score @s purchased_range matches 0 if score @s points matches 2000.. run tellraw @s [{"text":"Range Increased! +1 block attack range (permanent)","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor prismarine_shard if score @s purchased_range matches 0 if score @s points matches 2000.. run scoreboard players remove @s points 2000
clear @a[team=runners] prismarine_shard

# After purchase, replace the slot with a red glass pane (disabled)
execute as @a[team=runners] if score @s purchased_range matches 1 run item replace entity @s inventory.11 with green_stained_glass_pane[custom_name=[{"text":"Range Upgrade","italic":false,"color":"red"}],lore=[[{"text":"Already purchased","italic":false,"color":"gray"}]]]

# If not purchased, keep the upgrade item in the slot
execute as @a[team=runners] if score @s purchased_range matches 0 run item replace entity @s inventory.11 with prismarine_shard[custom_name=[{"text":"Range Upgrade","italic":false,"color":"dark_purple"}],lore=[[{"text":"Permanently increases your attack range by 1 block","italic":false,"color":"white"}],[{"text":"Can only be purchased once","italic":false,"color":"yellow"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $2000","italic":false,"color":"gold"}]]]
kill @e[type=item,nbt={Item:{id:"minecraft:green_stained_glass_pane"}}]
#=================================================================================================
#=================================================================================================
# PERMANENT KNOCKBACK RESISTANCE - inventory.20 (one-time purchase, +1 knockback resistance level)
# First, create the scoreboard objective if it doesn't exist (run once, e.g., in load function)
# scoreboard objectives add purchased_knockback_resistance dummy

execute as @a[team=runners] if items entity @s player.cursor turtle_helmet if score @s purchased_knockback_resistance matches 0 if score @s points matches ..1999 run tellraw @s [{"text":"Not enough points! you need $2000","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor turtle_helmet if score @s purchased_knockback_resistance matches 0 if score @s points matches 2000.. run scoreboard players set @s purchased_knockback_resistance 1
execute as @a[team=runners] if items entity @s player.cursor turtle_helmet if score @s purchased_knockback_resistance matches 0 if score @s points matches 2000.. run attribute @s knockback_resistance base set 0.4
execute as @a[team=runners] at @s if items entity @s player.cursor turtle_helmet if score @s purchased_knockback_resistance matches 0 if score @s points matches 2000.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor turtle_helmet if score @s purchased_knockback_resistance matches 0 if score @s points matches 2000.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor turtle_helmet if score @s purchased_knockback_resistance matches 0 if score @s points matches 2000.. run tellraw @s [{"text":"Knockback Resistance Increased! (permanent)","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor turtle_helmet if score @s purchased_knockback_resistance matches 0 if score @s points matches 2000.. run scoreboard players remove @s points 2000
clear @a[team=runners] turtle_helmet

# After purchase, replace the slot with a red glass pane (disabled)
execute as @a[team=runners] if score @s purchased_knockback_resistance matches 1 run item replace entity @s inventory.20 with green_stained_glass_pane[custom_name=[{"text":"Knockback Resistance Upgrade","italic":false,"color":"red"}],lore=[[{"text":"Already purchased","italic":false,"color":"gray"}]]]

# If not purchased, keep the upgrade item in the slot
execute as @a[team=runners] if score @s purchased_knockback_resistance matches 0 run item replace entity @s inventory.20 with turtle_helmet[custom_name=[{"text":"Knockback Resistance Upgrade","italic":false,"color":"dark_purple"}],lore=[[{"text":"Permanently increases knockback resistance by 50%","italic":false,"color":"white"}],[{"text":"Can only be purchased once","italic":false,"color":"yellow"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $2000","italic":false,"color":"gold"}]]]
#=================================================================================================
#=================================================================================================
# PERMANENT DAMAGE INCREASE - runners only, inventory.2 (one-time purchase, +1 attack damage)
# First, create the scoreboard objective if it doesn't exist (run once, e.g., in load function)
# scoreboard objectives add purchased_damage dummy

execute as @a[team=runners] if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches ..2499 run tellraw @s [{"text":"Not enough points! you need $2500","color":"red"}]
execute as @a[team=runners] if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches 2500.. run scoreboard players set @s purchased_damage 1
execute as @a[team=runners] if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches 2500.. run attribute @s attack_damage base set 2
execute as @a[team=runners] if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches 2500.. run effect give @s strength infinite 3 true
execute as @a[team=runners] at @s if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches 2500.. run playsound block.bell.resonate master @s
execute as @a[team=runners] at @s if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches 2500.. run playsound block.bell.use master @s
execute as @a[team=runners] if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches 2500.. run tellraw @s [{"text":"Damage Increased! +1 permanent attack damage","color":"green"}]
execute as @a[team=runners] if items entity @s player.cursor diamond_sword if score @s purchased_damage matches 0 if score @s points matches 2500.. run scoreboard players remove @s points 2500
clear @a[team=runners] diamond_sword

# After purchase, replace the slot with a red glass pane (disabled)
execute as @a[team=runners] if score @s purchased_damage matches 1 run item replace entity @s inventory.2 with green_stained_glass_pane[custom_name=[{"text":"Damage Upgrade","italic":false,"color":"red"}],lore=[[{"text":"Already purchased","italic":false,"color":"gray"}]]]

# If not purchased, keep the upgrade item in the slot
execute as @a[team=runners] if score @s purchased_damage matches 0 run item replace entity @s inventory.2 with diamond_sword[custom_name=[{"text":"Damage Upgrade","italic":false,"color":"gold"}],lore=[[{"text":"Permanently increases your attack damage by 1 heart","italic":false,"color":"white"}],[{"text":"Runner only","italic":false,"color":"yellow"}],[{"text":"Can only be purchased once","italic":false,"color":"yellow"}],[{"text":"-----------------------","italic":false}],[{"text":"Cost: $2500","italic":false,"color":"gold"}]]]
#=================================================================================================