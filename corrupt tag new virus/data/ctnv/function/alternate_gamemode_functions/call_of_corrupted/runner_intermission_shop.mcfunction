
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
