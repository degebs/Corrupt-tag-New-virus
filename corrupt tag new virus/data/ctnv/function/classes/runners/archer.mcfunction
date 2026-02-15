# █████╗ ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
#██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗
#███████║██████╔╝██║     ███████║█████╗  ██████╔╝
#██╔══██║██╔══██╗██║     ██╔══██║██╔══╝  ██╔══██╗
#██║  ██║██║  ██║╚██████╗██║  ██║███████╗██║  ██║
#╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                                        
# the infamus archer class
scoreboard players add @s acher_arrow_count 0
#==============================================================================================================================================================
#give the archer his bow

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] run clear @s bow

execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] run item replace entity @s hotbar.0 with bow[custom_name=[{"text":"Odysseus","italic":false}],enchantments={punch:2}]

# slight permanent speed buff
effect give @s speed 6 0 true
#==============================================================================================================================================================
# the hard part of this class will be keeping track of how many arrows the archer has
# 1. keep track of arrows
# 2. make sure that they cannot be duped
# 3. decreese the arrow count when one is shot
# 4. slowly regenerate arrows until a max is reached

# make sure that arrows cannot be duped or manipulated
execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] run clear @s arrow
execute if entity @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:arrow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 1 run item replace entity @s hotbar.1 with arrow 1

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 2 run item replace entity @s hotbar.1 with arrow 2

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 3 run item replace entity @s hotbar.1 with arrow 3

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 4 run item replace entity @s hotbar.1 with arrow 4

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 5 run item replace entity @s hotbar.1 with arrow 5

# check if the archer launches his arrow
execute if score @s bow_shot matches 1 run clear @s arrow
execute if score @s bow_shot matches 1 run scoreboard players remove @s acher_arrow_count 1
execute if score @s bow_shot matches 1 run scoreboard players reset @s bow_shot

# kill stationary arrows
kill @e[type=arrow,nbt={inGround:1b}]


# slowly regenerate arrows (unless at max arrows)
execute if score seconds time matches 20 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run clear @s arrow
execute if score seconds time matches 20 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run scoreboard players add @s acher_arrow_count 1

execute if score seconds time matches 40 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run clear @s arrow
execute if score seconds time matches 40 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run scoreboard players add @s acher_arrow_count 1

execute if score seconds time matches 50 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run clear @s arrow
execute if score seconds time matches 50 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run scoreboard players add @s acher_arrow_count 1

#==============================================================================================================================================================
# there was a balance sugestion. the atcher is boring and the bulk is OP
# this is an iteresting sugestion and i am testing here live
# this code was actually stolen

#kill any loose gray dye
execute as @e[type=item,nbt={Item:{id:"minecraft:gray_dye"}}] run kill @s

scoreboard players add @s bulk 0
scoreboard players add @s bulk_totem 0


# if the player drops the bulk item, start a 300 tick timer. then decrese by 1 until it can be used again (15 seconds)
execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:2b}]}] if score @s bulk matches 0 run scoreboard players set @s bulk 300
execute if score @s bulk matches 1.. run scoreboard players remove @s bulk 1
# give the bulk his jump boost
execute if score @s[scores={bulk=299}] bulk matches 299 run effect give @s jump_boost 5 1
execute if score @s[scores={bulk=299}] bulk matches 299 run effect give @s slowness 5 1
# sound effect
execute if score @s[scores={bulk=299}] bulk matches 299 run playsound entity.firework_rocket.launch player @s ~ ~ ~ 1 0.8 0.5
execute if score @s[scores={bulk=299}] bulk matches 299 run playsound entity.firework_rocket.launch player @s ~ ~ ~ 1 1 0.5

# fancy particles
execute if score @s[scores={bulk=200..}] bulk matches 200.. at @s[scores={bulk=200..}] run particle wax_on ~ ~0.1 ~ 0.5 0 0.5 0.2 10 force @a


# check to see if the candle has been dropped.
# give the bulk the Jump candle. make sure he cant manipulate it
#execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:2b}]}] run clear @a cyan_candle
execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:2b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:cyan_candle"}}]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:2b}]}] if score @s bulk matches 0 run item replace entity @s hotbar.2 with cyan_candle[custom_name=[{"text":"Jump candle","italic":false,"color":"dark_green"}],lore=[[{"text":"drop to jump","italic":false}]],rarity=uncommon]

# do a cooldown timer with drey dye
execute if score @s[scores={bulk=299}] bulk matches 299 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 15
execute if score @s[scores={bulk=280}] bulk matches 280 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 14
execute if score @s[scores={bulk=260}] bulk matches 260 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 13
execute if score @s[scores={bulk=240}] bulk matches 240 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 12
execute if score @s[scores={bulk=220}] bulk matches 220 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 11
execute if score @s[scores={bulk=200}] bulk matches 200 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 10
execute if score @s[scores={bulk=180}] bulk matches 180 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 9
execute if score @s[scores={bulk=160}] bulk matches 160 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 8
execute if score @s[scores={bulk=140}] bulk matches 140 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 7
execute if score @s[scores={bulk=120}] bulk matches 120 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 6
execute if score @s[scores={bulk=100}] bulk matches 100 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 5
execute if score @s[scores={bulk=80}] bulk matches 80 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 4
execute if score @s[scores={bulk=60}] bulk matches 60 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 3
execute if score @s[scores={bulk=40}] bulk matches 40 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 2
execute if score @s[scores={bulk=20}] bulk matches 20 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 1


# get rid of the gray dye when the cooldown is done
execute if score @s bulk matches 0 run clear @s gray_dye