#██╗   ███╗███████╗██████╗  ██████╗██╗  ██╗ █████╗ ███╗   ██╗████████╗
#████╗ ████║██╔════╝██╔══██╗██╔════╝██║  ██║██╔══██╗████╗  ██║╚══██╔══╝
#██╔████╔██║█████╗  ██████╔╝██║     ███████║███████║██╔██╗ ██║   ██║   
#██║╚██╔╝██║██╔══╝  ██╔══██╗██║     ██╔══██║██╔══██║██║╚██╗██║   ██║   
#██║ ╚═╝ ██║███████╗██║  ██║╚██████╗██║  ██║██║  ██║██║ ╚████║   ██║   
#╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   
                                                                      
# this class will work complely different to the other classes

scoreboard players add @s merchant_arrow_count 0
#==============================================================================================================================================================
#this code was stolen from the archer class

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:crossbow",Slot:0b}]}] run clear @s crossbow

execute unless entity @s[nbt={Inventory:[{id:"minecraft:crossbow",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:crossbow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:crossbow",Slot:0b}]}] run item replace entity @s hotbar.0 with crossbow[custom_name=[{"text":"Boston the crossbow","italic":false}],enchantments={punch:2}]

#==============================================================================================================================================================
# the hard part of this class will be keeping track of how many arrows the archer has
# 1. keep track of arrows
# 2. make sure that they cannot be duped
# 3. decreese the arrow count when one is shot
# 4. slowly regenerate arrows until a max is reached

# make sure that arrows cannot be duped or manipulated
execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] run clear @s arrow
execute if entity @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:arrow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 1 run item replace entity @s hotbar.1 with arrow 1

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 2 run item replace entity @s hotbar.1 with arrow 2

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 3 run item replace entity @s hotbar.1 with arrow 3

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 4 run item replace entity @s hotbar.1 with arrow 4

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 5 run item replace entity @s hotbar.1 with arrow 5

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 6 run item replace entity @s hotbar.1 with arrow 6

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 7 run item replace entity @s hotbar.1 with arrow 7

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 8 run item replace entity @s hotbar.1 with arrow 8

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s merchant_arrow_count matches 9.. run item replace entity @s hotbar.1 with arrow 9

# check if the merchant launches his arrow
execute if score @s cross_bow_shot matches 1 run clear @s arrow
execute if score @s cross_bow_shot matches 1 run scoreboard players remove @s merchant_arrow_count 1

# gain 10 luck for shooting an arrow
execute if score @s cross_bow_shot matches 1 run scoreboard players add @s merchant_luck 15
# gain 3 luck per second if within 2 blocks of the corrupted
execute at @s if entity @a[distance=..2,team=corrupted] if score tick time matches 2 run scoreboard players add @s merchant_luck 4


execute if score @s cross_bow_shot matches 1 run scoreboard players reset @s cross_bow_shot

# kill stationary arrows
kill @e[type=arrow,nbt={inGround:1b}]


# slowly regenerate arrows (unless at max arrows)
execute if score seconds time matches 20 if score tick time matches 3 unless score @s merchant_arrow_count matches 3 run clear @s arrow
execute if score seconds time matches 20 if score tick time matches 3 unless score @s merchant_arrow_count matches 3 run scoreboard players add @s merchant_arrow_count 1

execute if score seconds time matches 50 if score tick time matches 3 unless score @s merchant_arrow_count matches 3 run clear @s arrow
execute if score seconds time matches 50 if score tick time matches 3 unless score @s merchant_arrow_count matches 3 run scoreboard players add @s merchant_arrow_count 1


#==============================================================================================================================================================
#now for the merchants coin


# it also increases your luck score by 1 every time it hits 100
execute if score 360 time matches 20 run scoreboard players add @s merchant_luck 1
#every time the rng hits 100 give the player a coin
execute if score 360 time matches 20 run function ctnv:one_time_function/merchant_coin_giver


# grant an acheavement if the luck is 100 or more
execute if score @s merchant_luck matches 100.. if score 360 time matches 20 run advancement grant @s only ctnv:corrupt_tag/merchant_luck_100

# sycle the rng
execute if score tick time matches 5 run scoreboard players add @s merchant_rng 2
execute if score tick time matches 5 if score @s merchant_rng matches 100.. run scoreboard players set @s merchant_rng 0


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# here we handle when the merchant drops his coin

# if the merchants luck is greater than the rng then give the player a reward
# but if not then punish the player

# check if good ending
execute if score @s merchant_coin matches 1.. if score @s merchant_luck >= @s merchant_rng at @s run function ctnv:one_time_function/merchant_coin_good

# check if bad ending
execute if score @s merchant_coin matches 1.. if score @s merchant_luck < @s merchant_rng at @s run function ctnv:one_time_function/merchant_coin_bad

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# when the merchant drops his coin reset his luck to 0
execute if score @s merchant_coin matches 1.. run scoreboard players set @s merchant_luck 0
execute if score @s merchant_coin matches 1.. run kill @e[type=item,nbt={Item:{id:"minecraft:sunflower"}}]

execute if score @s merchant_coin matches 1.. run clear @s sunflower
execute if score @s merchant_coin matches 1.. run scoreboard players reset @s merchant_coin
