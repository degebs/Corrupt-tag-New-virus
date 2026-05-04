#██████╗ ██╗██████╗  █████╗ ████████╗███████╗
#██╔══██╗██║██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
#██████╔╝██║██████╔╝███████║   ██║   █████╗  
#██╔═══╝ ██║██╔══██╗██╔══██║   ██║   ██╔══╝  
#██║     ██║██║  ██║██║  ██║   ██║   ███████╗
#╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
# everyones favorite rum drinking, shwashbuckling, peg leg having, eye patch wearing, parrot owning, treasure hunting, ship sailing, class                                           

#==============================================================================================================================================================
#give the pirate THE CUTLASS

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run clear @s iron_sword

execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run item replace entity @s hotbar.0 with iron_sword[custom_name=[{"text":"Cutlass","italic":false}],rarity=uncommon,enchantments={knockback:1},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]

#==============================================================================================================================================================
scoreboard players add @s RUM_cooldown 0
scoreboard players add @s potion_drink_detect 0
scoreboard players add @s RUM_count 0

# the RUM
execute if score @s potion_drink_detect matches 0 if score @s RUM_cooldown matches 0 run item replace entity @s hotbar.1 with potion[potion_contents={custom_color:8606770,custom_effects:[{id:speed,duration:100,amplifier:2},{id:jump_boost,duration:60,amplifier:1},{id:nausea,duration:20,amplifier:50}]},custom_name=[{"text":"THE BIG BOTTLE OF RUM","italic":false}],item_name=[{"text":"THE BIG BOTTLE OF RUM","italic":false}],rarity=uncommon,tooltip_display={hide_tooltip:true}]
execute if score @s potion_drink_detect matches 0 if score @s RUM_cooldown matches 0 run kill @e[type=item,nbt={Item:{id:"minecraft:potion"}}]

# if he drinks it do a few things
execute if score @s potion_drink_detect matches 1 run scoreboard players add @s RUM_count 1
execute if score @s potion_drink_detect matches 1 run clear @s potion
# give 1 heart
execute if score @s potion_drink_detect matches 1 run scoreboard players add @s health 1


# 30 second cooldown
execute if score @s potion_drink_detect matches 1 run scoreboard players set @s RUM_cooldown 600
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# the nausia effect gets progressivly worse the more you drink the rum
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 1 run effect give @s minecraft:nausea 3 1 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 2 run effect give @s minecraft:nausea 6 6 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 3 run effect give @s minecraft:nausea 13 6 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 4 run effect give @s minecraft:nausea 16 6 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 5 run effect give @s minecraft:nausea 19 6 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 6 run effect give @s minecraft:nausea 22 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 7 run effect give @s minecraft:nausea 27 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 8 run effect give @s minecraft:nausea 29 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 9 run effect give @s minecraft:nausea 32 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 10 run effect give @s minecraft:nausea 38 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 11.. run effect give @s minecraft:nausea 45 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 11.. run effect give @s minecraft:blindness 25 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 21.. run effect give @s minecraft:blindness 130 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 21.. run effect give @s minecraft:darkness 130 16 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 23.. run effect give @s minecraft:slowness 30 3 true
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 30.. run scoreboard players remove @s health 1
# if you are drinking 30 bottles of rum then your liver will fail. just like in real life.

# acheavent for being an alcoholic
execute if score @s potion_drink_detect matches 1 if score @s RUM_count matches 11.. run advancement grant @s only ctnv:corrupt_tag/drunken_sailor

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

execute if score @s potion_drink_detect matches 1 run scoreboard players set @s potion_drink_detect 0

execute if score @s RUM_cooldown matches 1.. run scoreboard players remove @s RUM_cooldown 1

execute if score @s RUM_cooldown matches 599 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 30
execute if score @s RUM_cooldown matches 580 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 29
execute if score @s RUM_cooldown matches 560 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 28
execute if score @s RUM_cooldown matches 540 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 27
execute if score @s RUM_cooldown matches 520 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 26
execute if score @s RUM_cooldown matches 500 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 25
execute if score @s RUM_cooldown matches 480 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 24
execute if score @s RUM_cooldown matches 460 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 23
execute if score @s RUM_cooldown matches 440 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 22
execute if score @s RUM_cooldown matches 420 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 21
execute if score @s RUM_cooldown matches 400 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 20
execute if score @s RUM_cooldown matches 380 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 19
execute if score @s RUM_cooldown matches 360 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 18
execute if score @s RUM_cooldown matches 340 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 17
execute if score @s RUM_cooldown matches 320 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 16
execute if score @s RUM_cooldown matches 300 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 15
execute if score @s RUM_cooldown matches 280 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 14
execute if score @s RUM_cooldown matches 260 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 13
execute if score @s RUM_cooldown matches 240 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 12
execute if score @s RUM_cooldown matches 220 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 11
execute if score @s RUM_cooldown matches 200 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 10
execute if score @s RUM_cooldown matches 180 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 9
execute if score @s RUM_cooldown matches 160 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 8
execute if score @s RUM_cooldown matches 140 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 7
execute if score @s RUM_cooldown matches 120 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 6
execute if score @s RUM_cooldown matches 100 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 5
execute if score @s RUM_cooldown matches 80 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 4
execute if score @s RUM_cooldown matches 60 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 3
execute if score @s RUM_cooldown matches 40 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 2
execute if score @s RUM_cooldown matches 20 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 1
execute if score @s RUM_cooldown matches 0 run clear @s minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]]

# the cooldown numbers will be randomised when drinking the rum after 6 drinks

execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 599 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 1
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 580 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 29
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 560 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 3
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 540 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 27
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 520 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 5
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 500 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 25
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 480 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 7
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 460 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 23
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 440 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 9
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 420 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 21
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 400 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 11
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 380 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 19
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 360 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 13
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 340 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 17
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 320 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 64
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 300 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 15
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 280 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 17
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 260 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 13
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 240 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 19
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 220 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 11
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 200 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 21
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 180 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 9
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 160 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 23
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 140 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 7
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 120 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 25
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 100 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 5
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 80 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 26
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 60 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 3
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 40 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 27
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 20 run item replace entity @s hotbar.1 with minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]] 1
execute if score @s RUM_count matches 6.. if score @s RUM_cooldown matches 0 run clear @s minecraft:gray_dye[custom_name=[{"text":"RUM cooldown","italic":false}]]


#==============================================================================================================================================================
# the northless compass
#==============================================================================================================================================================
# the normal version
execute if score endgame state matches 0 run function ctnv:one_time_function/northless_compass
# the endgame version, which has a different function to run when you drop it
execute if score endgame state matches 1 run function ctnv:one_time_function/northless_compass_engame