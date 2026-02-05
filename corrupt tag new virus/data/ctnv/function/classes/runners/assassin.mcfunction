
# █████╗ ███████╗███████╗ █████╗ ███████╗███████╗██╗███╗   ██╗
#██╔══██╗██╔════╝██╔════╝██╔══██╗██╔════╝██╔════╝██║████╗  ██║
#███████║███████╗███████╗███████║███████╗███████╗██║██╔██╗ ██║
#██╔══██║╚════██║╚════██║██╔══██║╚════██║╚════██║██║██║╚██╗██║
#██║  ██║███████║███████║██║  ██║███████║███████║██║██║ ╚████║
#╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝

# the assassin! hes back in the sequel! now with a few new abilitys
scoreboard players add @s assassin_charge 0

#==============================================================================================================================================================
#give the assassin his daggar

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:stone_sword",Slot:0b}]}] run clear @s stone_sword

execute unless entity @s[nbt={Inventory:[{id:"minecraft:stone_sword",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:stone_sword"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:stone_sword",Slot:0b}]}] run item replace entity @s hotbar.0 with stone_sword[custom_name=[{"text":"sKaiken","italic":false}],enchantments={knockback:1}]

#==============================================================================================================================================================
# permanent speed boost in endgame
execute if score endgame state matches 1 run effect give @s speed 1 0 true


#==============================================================================================================================================================
# invisability when crouched
execute if score @s assassin_hide matches 1.. run effect give @s invisibility 1 1 false
execute if score @s assassin_hide matches 1.. run effect give @s slowness 3 3 false
execute if score @s assassin_hide matches 1.. run scoreboard players reset @s assassin_hide
# he also gets slowness
#==============================================================================================================================================================
# ink sack with a speed boost that blinds corrupted

# if the player drops the assassin item, start a 300 tick timer. then decrease by 1 until it can be used again (15 seconds)
execute unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:1b}]}] if score @s assassin_charge matches 0 run scoreboard players set @s assassin_charge 500
execute if score @s assassin_charge matches 1.. run scoreboard players remove @s assassin_charge 1

# give the assassin his speed boost
execute if score @s[scores={assassin_charge=499}] assassin_charge matches 499 run effect give @s speed 6 2
execute if score @s[scores={assassin_charge=499}] assassin_charge matches 499 run effect clear @s slowness

# if there are any corrupted nearby. give them blindness
execute if score @s[scores={assassin_charge=499}] assassin_charge matches 499 at @s run effect give @a[distance=..5,team=corrupted] blindness 5 2



# sound effect
execute if score @s[scores={assassin_charge=499}] assassin_charge matches 499 run playsound entity.firework_rocket.launch player @s ~ ~ ~ 1 0.8 0.5
execute if score @s[scores={assassin_charge=499}] assassin_charge matches 499 run playsound entity.generic.explode player @s ~ ~ ~ 1 1 0.5

# fancy particles
execute if score @s[scores={assassin_charge=480..}] assassin_charge matches 480.. at @s[scores={assassin_charge=200..}] run particle large_smoke ~ ~0.1 ~ 0.5 0 0.5 0.2 10 force @a
execute if score @s[scores={assassin_charge=299..}] assassin_charge matches 499.. at @s[scores={assassin_charge=200..}] run particle campfire_signal_smoke ~ ~0.1 ~ 0.5 1 0.5 0.1 100 force @a
execute if score @s[scores={assassin_charge=20..}] assassin_charge matches 20.. at @s[scores={assassin_charge=20..}] run particle white_smoke ~ ~0.1 ~ 0 0 0 0.01 1 force @a

# check to see if the ink sac has been dropped.
# give the assassin the Jump item. make sure they can't manipulate it
execute unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:1b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:ink_sac"}}]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:1b}]}] if score @s assassin_charge matches 0 run item replace entity @s hotbar.1 with ink_sac[custom_name=[{"text":"Supido","italic":false,"color":"dark_green"}],lore=[[{"text":"drop to jump","italic":false}]],rarity=uncommon]

# cooldown visuals using gray dye
execute if score @s assassin_charge matches 500 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 25
execute if score @s assassin_charge matches 480 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 24
execute if score @s assassin_charge matches 460 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 23
execute if score @s assassin_charge matches 440 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 22
execute if score @s assassin_charge matches 420 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 21
execute if score @s assassin_charge matches 400 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 20
execute if score @s assassin_charge matches 380 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 19
execute if score @s assassin_charge matches 360 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 18
execute if score @s assassin_charge matches 340 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 17
execute if score @s assassin_charge matches 320 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 16
execute if score @s assassin_charge matches 300 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 15
execute if score @s assassin_charge matches 280 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 14
execute if score @s assassin_charge matches 260 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 13
execute if score @s assassin_charge matches 240 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 12
execute if score @s assassin_charge matches 220 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 11
execute if score @s assassin_charge matches 200 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 10
execute if score @s assassin_charge matches 180 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 9
execute if score @s assassin_charge matches 160 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 8
execute if score @s assassin_charge matches 140 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 7
execute if score @s assassin_charge matches 120 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 6
execute if score @s assassin_charge matches 100 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 5
execute if score @s assassin_charge matches 80 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 4
execute if score @s assassin_charge matches 60 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 3
execute if score @s assassin_charge matches 40 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 2
execute if score @s assassin_charge matches 20 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 1
# remove gray dye when cooldown is done
execute if score @s assassin_charge matches 0 run clear @s gray_dye



#================================================================================================================
# the absence of presence calling card
# given to whoever goes 4 minuts without a single percentage of corruption crouching
execute as @a[team=runners,scores={corruption=0}] if score @s crouch_time matches 1.. run scoreboard players add @s absence 1
# only workes if there is NO corruption
execute as @a[scores={absence=4800}] run advancement grant @s only ctnv:corrupt_tag/absence
# 10 minuts is 12000 ticks