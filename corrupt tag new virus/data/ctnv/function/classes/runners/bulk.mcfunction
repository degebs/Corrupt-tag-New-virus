
#██████╗ ██╗   ██╗██╗     ██╗  ██╗
#██╔══██╗██║   ██║██║     ██║ ██╔╝
#██████╔╝██║   ██║██║     █████╔╝ 
#██╔══██╗██║   ██║██║     ██╔═██╗ 
#██████╔╝╚██████╔╝███████╗██║  ██╗
#╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
# the defualt runner class
#significantly improved form the origional "warior"

# here is all the logic related to the bulk

#kill any loose gray dye
execute as @e[type=item,nbt={Item:{id:"minecraft:gray_dye"}}] run kill @s

scoreboard players add @s bulk 0
scoreboard players add @s bulk_totem 0


# if the player drops the bulk item, start a 300 tick timer. then decrese by 1 until it can be used again (15 seconds)
execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:1b}]}] if score @s bulk matches 0 run scoreboard players set @s bulk 300
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
#execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:1b}]}] run clear @a cyan_candle
execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:1b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:cyan_candle"}}]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:cyan_candle",Slot:1b}]}] if score @s bulk matches 0 run item replace entity @s hotbar.1 with cyan_candle[custom_name=[{"text":"Häagen Dazs","italic":false,"color":"dark_green"}],lore=[[{"text":"drop to jump","italic":false}]],rarity=uncommon]

# do a cooldown timer with drey dye
execute if score @s[scores={bulk=299}] bulk matches 299 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 15
execute if score @s[scores={bulk=280}] bulk matches 280 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 14
execute if score @s[scores={bulk=260}] bulk matches 260 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 13
execute if score @s[scores={bulk=240}] bulk matches 240 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 12
execute if score @s[scores={bulk=220}] bulk matches 220 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 11
execute if score @s[scores={bulk=200}] bulk matches 200 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 10
execute if score @s[scores={bulk=180}] bulk matches 180 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 9
execute if score @s[scores={bulk=160}] bulk matches 160 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 8
execute if score @s[scores={bulk=140}] bulk matches 140 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 7
execute if score @s[scores={bulk=120}] bulk matches 120 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 6
execute if score @s[scores={bulk=100}] bulk matches 100 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 5
execute if score @s[scores={bulk=80}] bulk matches 80 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 4
execute if score @s[scores={bulk=60}] bulk matches 60 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 3
execute if score @s[scores={bulk=40}] bulk matches 40 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 2
execute if score @s[scores={bulk=20}] bulk matches 20 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 1


# get rid of the gray dye when the cooldown is done
execute if score @s bulk matches 0 run clear @s gray_dye

#==============================================================================================================================================================
#give the bulk his knockback sword

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run clear @s iron_sword

execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run item replace entity @s hotbar.0 with iron_sword[custom_name=[{"text":"The Sultan of Swing","italic":false}],rarity=uncommon,enchantments={knockback:2},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]


#==============================================================================================================================================================
# the totem of undying for corrupt tag
execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 0 run clear @s totem_of_undying
execute if score @s bulk_totem matches 1.. run clear @s totem_of_undying


execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 0 run kill @e[type=item,nbt={Item:{id:"minecraft:totem_of_undying"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 0 run item replace entity @s hotbar.2 with totem_of_undying[item_name="Freyr"]
# if the player is at 0 health, trigger the totem.
# triggering the totem means
# 1. set the bulkts health back to its max
# 2. do particles and sounds
# 3. disable the totem 
# 4. only do any of this if the totem is in the main hand


# particles and sound effects
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. at @s run particle totem_of_undying ~ ~1 ~ 0.5 1 0.5 1 200 force @a
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. at @s run playsound item.totem.use player @a ~ ~ ~ 1 1

# update the bulk_totem count to 2. whenever the player turns from corrupted to runner bulk subtract 1 from this (unless its already 0)
# the bulk will have to be corrupted then uncorrupted twice to get the totem back
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. run scoreboard players set @s bulk_totem 2
execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 1.. if score @s hit matches 1.. run clear @s totem_of_undying
# reset the health
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. run scoreboard players operation @s health = @a[scores={ST____max_health=1..},limit=1,sort=arbitrary] ST____max_health






#==============================================================================================================================================================
# faster regen
# its just the regen logic but at the 10 second mark, as well as the the normal healing time.
# doing it twice technically makes this faster regeneration
execute as @a[team=runners,scores={class=3}] if score tick time matches 10 if score seconds time matches 10 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 run scoreboard players add @s health 1
# particles to indicate healing
execute as @a[team=runners,scores={class=3}] at @s if score seconds time matches 10 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 run particle minecraft:happy_villager ~ ~1 ~ 0.2 1 0.2 1 5 force @a

#==============================================================================================================================================================
# make his shield breakable
# if you are within 3 blocks of the corrupted, for 10 seconds, your shield will break

# for some reason this command does not work... exept when i run the command manually in game...
# fuck
execute at @s if entity @a[team=corrupted,distance=..3] run scoreboard players add @s shield_breaker 1

# 10 seconds is 200 ticks
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run clear @s shield
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run particle crit ~ ~1 ~ 0 0 0 0.2 15 force @a
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run playsound item.shield.break player @s ~ ~ ~ 1 1 0.6
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run scoreboard players reset @s shield_breaker 

#==============================================================================================================================================================
#give the bulk his shield

# make sure it cannot be moved
execute if entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run clear @s minecraft:shield

execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:35b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:shield"}}]

# for some reason this shield is completly unbreakable. so i need to maunually add damage to it
execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:35b}]}] if score 360 time matches 290 run item replace entity @s weapon.offhand with shield[custom_name=[{"text":"bulky shield","italic":false}],rarity=uncommon,damage=335]


# clears any corrupted items.
# sometimes corrupted items may appear in the invetory of runners.
# we need to make sure this cannot happen
clear @s glowstone_dust
clear @s sugar
clear @s chorus_fruit

