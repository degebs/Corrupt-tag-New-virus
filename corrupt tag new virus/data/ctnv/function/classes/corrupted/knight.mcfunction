#██╗  ██╗███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
#██║ ██╔╝████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝
#█████╔╝ ██╔██╗ ██║██║██║  ███╗███████║   ██║   
#██╔═██╗ ██║╚██╗██║██║██║   ██║██╔══██║   ██║   
#██║  ██╗██║ ╚████║██║╚██████╔╝██║  ██║   ██║   
#╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝  
# the knight is a wierd kind of guy. his kit is inconsistent.
#im gonna have to change the book for this one

# by far the most contraversial class. the entire group demmands that this class be NERFED to hell.
# he has receved so many L's in recent history.
#every other update has nerfed the knight in some way

# armor setup
item replace entity @s armor.chest with iron_chestplate[trim={pattern:silence,material:iron},enchantments={binding_curse:1}]
item replace entity @s armor.head with golden_helmet[trim={pattern:silence,material:iron},enchantments={binding_curse:1}]
item replace entity @s armor.legs with iron_leggings[trim={pattern:silence,material:iron},enchantments={binding_curse:1}]
item replace entity @s armor.feet with netherite_boots[trim={pattern:silence,material:iron},enchantments={binding_curse:1}]

# give him his sword
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:0b}]}] run clear @s netherite_sword

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_sword"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:0b}]}] run item replace entity @s hotbar.0 with netherite_sword[custom_name=[{"text":"Corrupted sword","italic":false,"color":"dark_purple"}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]

#============================================================================================================================================================
# full stun immunity
execute if score @s corruption matches 15.. run effect clear @s slowness
execute if score @s corruption matches 15.. run effect clear @s blindness
# full knockback imunity
execute if score @s corruption matches 15.. run attribute @s knockback_resistance base set 2000
# if the knight gets hit do a bunch of particles
execute if score @s corruption matches 15.. run execute at @s if score @s hit matches 1.. run particle sonic_boom ~ ~1 ~ 0.1 0.1 0.1 1 2 force @a
execute if score @s corruption matches 15.. run execute at @s if score @s hit matches 1.. run playsound minecraft:entity.warden.sonic_charge block @a ~ ~ ~ 1 2 0.5 
execute if score @s corruption matches 15.. run execute at @s if score @s hit matches 1.. run scoreboard players set @s hit 0

# for the longest time this did not happen at 15% corruption. now it does. because he needs a nerf

#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"Your attack power doubles. ","color":"dark_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run effect give @s speed 15 0 true
# do an extra damage
execute if score @s corruption matches 15.. run execute as @a[team=runners] if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players remove @s health 1
execute if score @s corruption matches 15.. run execute as @a[team=runners] at @s if score @s hit matches 1.. if score @s health matches 1.. run particle explosion ~ ~ ~ 0.5 0.5 0.5 1 15 normal @a
execute if score @s corruption matches 15.. run execute as @a[team=runners] at @s if score @s hit matches 1.. if score @s health matches 1.. run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5


#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================

execute if score @s corruption matches 50.. run effect give @s speed 1 0 true 


execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1



# the suggar item
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] if score @s knight_speed_boost matches 0 run scoreboard players set @s knight_speed_boost 600

execute if score @s corruption matches 50.. if score @s knight_speed_boost matches 1.. run scoreboard players remove @s knight_speed_boost 1
# give the corrupted speed
execute if score @s corruption matches 50.. if score @s[scores={knight_speed_boost=599}] knight_speed_boost matches 599 run effect give @s speed 1 6

# sound effect
execute if score @s[scores={knight_speed_boost=599}] knight_speed_boost matches 599 run playsound entity.generic.eat player @s ~ ~ ~ 1 0.3 0.5

# check to see if the sugar has been dropped.
# give the corrupted the sugar dust. make sure he cant manipulate it
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:sugar"}}]
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] if score @s knight_speed_boost matches 0 run item replace entity @s hotbar.4 with sugar[custom_name=[{"text":"speed boost","italic":false}],lore=[[{"text":"drop for a speed boost","italic":false}]]]


execute if score @s[scores={knight_speed_boost=599}] knight_speed_boost matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 30
execute if score @s[scores={knight_speed_boost=580}] knight_speed_boost matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 29
execute if score @s[scores={knight_speed_boost=560}] knight_speed_boost matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 28
execute if score @s[scores={knight_speed_boost=540}] knight_speed_boost matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 27
execute if score @s[scores={knight_speed_boost=520}] knight_speed_boost matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 26
execute if score @s[scores={knight_speed_boost=500}] knight_speed_boost matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 25
execute if score @s[scores={knight_speed_boost=480}] knight_speed_boost matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 24
execute if score @s[scores={knight_speed_boost=460}] knight_speed_boost matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 23
execute if score @s[scores={knight_speed_boost=440}] knight_speed_boost matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 22
execute if score @s[scores={knight_speed_boost=420}] knight_speed_boost matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 21
execute if score @s[scores={knight_speed_boost=400}] knight_speed_boost matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 20
execute if score @s[scores={knight_speed_boost=380}] knight_speed_boost matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 19
execute if score @s[scores={knight_speed_boost=360}] knight_speed_boost matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 18
execute if score @s[scores={knight_speed_boost=340}] knight_speed_boost matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 17
execute if score @s[scores={knight_speed_boost=320}] knight_speed_boost matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 16
execute if score @s[scores={knight_speed_boost=300}] knight_speed_boost matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 50
execute if score @s[scores={knight_speed_boost=280}] knight_speed_boost matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 14
execute if score @s[scores={knight_speed_boost=260}] knight_speed_boost matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 13
execute if score @s[scores={knight_speed_boost=240}] knight_speed_boost matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 12
execute if score @s[scores={knight_speed_boost=220}] knight_speed_boost matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 11
execute if score @s[scores={knight_speed_boost=200}] knight_speed_boost matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 10
execute if score @s[scores={knight_speed_boost=180}] knight_speed_boost matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 9
execute if score @s[scores={knight_speed_boost=160}] knight_speed_boost matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 8
execute if score @s[scores={knight_speed_boost=140}] knight_speed_boost matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 7
execute if score @s[scores={knight_speed_boost=120}] knight_speed_boost matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 6
execute if score @s[scores={knight_speed_boost=100}] knight_speed_boost matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 5
execute if score @s[scores={knight_speed_boost=80}] knight_speed_boost matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 4
execute if score @s[scores={knight_speed_boost=60}] knight_speed_boost matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 3
execute if score @s[scores={knight_speed_boost=40}] knight_speed_boost matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 2
execute if score @s[scores={knight_speed_boost=20}] knight_speed_boost matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s knight_speed_boost matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]]

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# if the player drops the glowstone item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] if score @s knight_reveal_players matches 0 run scoreboard players set @s knight_reveal_players 600

execute if score @s corruption matches 50.. if score @s knight_reveal_players matches 1.. run scoreboard players remove @s knight_reveal_players 1
# give the corrupted his vission of all runners
execute if score @s corruption matches 50.. if score @s[scores={knight_reveal_players=599,evil_class=5}] knight_reveal_players matches 599 run effect give @a[team=runners] glowing 5 1

# sound effect
execute if score @s[scores={knight_reveal_players=599}] knight_reveal_players matches 599 run playsound block.beacon.activate player @s[scores={evil_class=5}] ~ ~ ~ 1 1 0.5


# check to see if the glowstone has been dropped.
# give the corrupted the glowstone dust. make sure he cant manipulate it
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust"}}]
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] if score @s knight_reveal_players matches 0 run item replace entity @s hotbar.2 with glowstone_dust[custom_name=[{"text":"reveal players","italic":false,"color":"yellow"}],lore=[[{"text":"drop to reveal players","italic":false}]]]

# do a cooldown timer with drey dye
execute if score @s[scores={knight_reveal_players=599}] knight_reveal_players matches 599 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 30
execute if score @s[scores={knight_reveal_players=580}] knight_reveal_players matches 580 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 29
execute if score @s[scores={knight_reveal_players=560}] knight_reveal_players matches 560 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 28
execute if score @s[scores={knight_reveal_players=540}] knight_reveal_players matches 540 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 27
execute if score @s[scores={knight_reveal_players=520}] knight_reveal_players matches 520 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 26
execute if score @s[scores={knight_reveal_players=500}] knight_reveal_players matches 500 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 25
execute if score @s[scores={knight_reveal_players=480}] knight_reveal_players matches 480 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 24
execute if score @s[scores={knight_reveal_players=460}] knight_reveal_players matches 460 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 23
execute if score @s[scores={knight_reveal_players=440}] knight_reveal_players matches 440 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 22
execute if score @s[scores={knight_reveal_players=420}] knight_reveal_players matches 420 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 21
execute if score @s[scores={knight_reveal_players=400}] knight_reveal_players matches 400 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 20
execute if score @s[scores={knight_reveal_players=380}] knight_reveal_players matches 380 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 19
execute if score @s[scores={knight_reveal_players=360}] knight_reveal_players matches 360 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 18
execute if score @s[scores={knight_reveal_players=340}] knight_reveal_players matches 340 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 17
execute if score @s[scores={knight_reveal_players=320}] knight_reveal_players matches 320 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 16
execute if score @s[scores={knight_reveal_players=300}] knight_reveal_players matches 300 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 50
execute if score @s[scores={knight_reveal_players=280}] knight_reveal_players matches 280 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 14
execute if score @s[scores={knight_reveal_players=260}] knight_reveal_players matches 260 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 13
execute if score @s[scores={knight_reveal_players=240}] knight_reveal_players matches 240 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 12
execute if score @s[scores={knight_reveal_players=220}] knight_reveal_players matches 220 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 11
execute if score @s[scores={knight_reveal_players=200}] knight_reveal_players matches 200 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 10
execute if score @s[scores={knight_reveal_players=180}] knight_reveal_players matches 180 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 9
execute if score @s[scores={knight_reveal_players=160}] knight_reveal_players matches 160 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 8
execute if score @s[scores={knight_reveal_players=140}] knight_reveal_players matches 140 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 7
execute if score @s[scores={knight_reveal_players=120}] knight_reveal_players matches 120 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 6
execute if score @s[scores={knight_reveal_players=100}] knight_reveal_players matches 100 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 5
execute if score @s[scores={knight_reveal_players=80}] knight_reveal_players matches 80 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 4
execute if score @s[scores={knight_reveal_players=60}] knight_reveal_players matches 60 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 3
execute if score @s[scores={knight_reveal_players=40}] knight_reveal_players matches 40 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 2
execute if score @s[scores={knight_reveal_players=20}] knight_reveal_players matches 20 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s knight_reveal_players matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]]

#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# jump boost and speed boost
execute if score @s corruption matches 90.. run effect give @s jump_boost 1 1 true


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# the corruption treatment
# this treatment will temporarrly stop the corruption

# if the player drops the magma cream item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute if score @s corruption matches 91.. unless entity @s[nbt={Inventory:[{id:"minecraft:magma_cream",Slot:6b}]}] if score @s knight_corruption_blocker matches 0 run scoreboard players set @s knight_corruption_blocker 600

execute if score @s corruption matches 91.. if score @s knight_corruption_blocker matches 1.. run scoreboard players remove @s knight_corruption_blocker 1
# temporarly stop corruption
execute if score @s corruption matches 91.. if score @s knight_corruption_blocker matches 400.. run scoreboard players set corruption_tick corruption 1 

# sound effect
execute if score @s[scores={knight_corruption_blocker=599}] knight_corruption_blocker matches 599 run playsound block.beacon.deactivate player @s[scores={evil_class=5}] ~ ~ ~ 1 0.2 0.5
# particles
execute if score @s corruption matches 91.. if score @s knight_corruption_blocker matches 400.. at @s run particle happy_villager ~ ~ ~ 1 1 1 0.1 2 force @a
execute if score @s corruption matches 91.. if score @s knight_corruption_blocker matches 400.. at @s run particle portal ~ ~ ~ 1 1 1 0.1 2 force @a


# check to see if the glowstone has been dropped.
# give the corrupted the glowstone dust. make sure he cant manipulate it
execute if score @s corruption matches 91.. unless entity @s[nbt={Inventory:[{id:"minecraft:magma_cream",Slot:6b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:magma_cream"}}]
execute if score @s corruption matches 91.. unless entity @s[nbt={Inventory:[{id:"minecraft:magma_cream",Slot:6b}]}] if score @s knight_corruption_blocker matches 0 run item replace entity @s hotbar.6 with magma_cream[custom_name=[{"text":"corruption blocker","italic":false,"color":"yellow"}],lore=[[{"text":"drop to halt your corruption","italic":false}]]]

# do a cooldown timer with drey dye
execute if score @s[scores={knight_corruption_blocker=599}] knight_corruption_blocker matches 599 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 30
execute if score @s[scores={knight_corruption_blocker=580}] knight_corruption_blocker matches 580 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 29
execute if score @s[scores={knight_corruption_blocker=560}] knight_corruption_blocker matches 560 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 28
execute if score @s[scores={knight_corruption_blocker=540}] knight_corruption_blocker matches 540 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 27
execute if score @s[scores={knight_corruption_blocker=520}] knight_corruption_blocker matches 520 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 26
execute if score @s[scores={knight_corruption_blocker=500}] knight_corruption_blocker matches 500 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 25
execute if score @s[scores={knight_corruption_blocker=480}] knight_corruption_blocker matches 480 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 24
execute if score @s[scores={knight_corruption_blocker=460}] knight_corruption_blocker matches 460 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 23
execute if score @s[scores={knight_corruption_blocker=440}] knight_corruption_blocker matches 440 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 22
execute if score @s[scores={knight_corruption_blocker=420}] knight_corruption_blocker matches 420 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 21
execute if score @s[scores={knight_corruption_blocker=400}] knight_corruption_blocker matches 400 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 20
execute if score @s[scores={knight_corruption_blocker=380}] knight_corruption_blocker matches 380 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 19
execute if score @s[scores={knight_corruption_blocker=360}] knight_corruption_blocker matches 360 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 18
execute if score @s[scores={knight_corruption_blocker=340}] knight_corruption_blocker matches 340 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 17
execute if score @s[scores={knight_corruption_blocker=320}] knight_corruption_blocker matches 320 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 16
execute if score @s[scores={knight_corruption_blocker=300}] knight_corruption_blocker matches 300 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 50
execute if score @s[scores={knight_corruption_blocker=280}] knight_corruption_blocker matches 280 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 14
execute if score @s[scores={knight_corruption_blocker=260}] knight_corruption_blocker matches 260 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 13
execute if score @s[scores={knight_corruption_blocker=240}] knight_corruption_blocker matches 240 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 12
execute if score @s[scores={knight_corruption_blocker=220}] knight_corruption_blocker matches 220 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 11
execute if score @s[scores={knight_corruption_blocker=200}] knight_corruption_blocker matches 200 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 10
execute if score @s[scores={knight_corruption_blocker=180}] knight_corruption_blocker matches 180 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 9
execute if score @s[scores={knight_corruption_blocker=160}] knight_corruption_blocker matches 160 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 8
execute if score @s[scores={knight_corruption_blocker=140}] knight_corruption_blocker matches 140 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 7
execute if score @s[scores={knight_corruption_blocker=120}] knight_corruption_blocker matches 120 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 6
execute if score @s[scores={knight_corruption_blocker=100}] knight_corruption_blocker matches 100 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 5
execute if score @s[scores={knight_corruption_blocker=80}] knight_corruption_blocker matches 80 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 4
execute if score @s[scores={knight_corruption_blocker=60}] knight_corruption_blocker matches 60 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 3
execute if score @s[scores={knight_corruption_blocker=40}] knight_corruption_blocker matches 40 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 2
execute if score @s[scores={knight_corruption_blocker=20}] knight_corruption_blocker matches 20 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s knight_corruption_blocker matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"Corruption Blocker cooldown","italic":false}]]

#particles at 90 percent
execute at @s if score @s corruption matches 90.. run particle crimson_spore ~ ~ ~ 2 1 2 0.5 5 force @a
